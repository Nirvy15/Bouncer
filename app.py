from flask import Flask, request, render_template, redirect, url_for
import pymysql.cursors
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

def get_db_connection():
    return pymysql.connect(host=os.getenv('DB_HOST', 'default_host'),
                           user=os.getenv('DB_USER', 'default_user'),
                           password=os.getenv('DB_PASSWORD', ''),
                           db=os.getenv('DB_NAME', 'default_db'),
                           charset='utf8mb4',
                           cursorclass=pymysql.cursors.DictCursor)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            sql = "SELECT * FROM users WHERE email = %s AND password = %s"
            cursor.execute(sql, (username, password))
            result = cursor.fetchone()
            if result:
                user_id = result['id']
                user_name = result['name']

                # Fetch all events the user is registered for with the Zoom meeting links
                cursor.execute("""
                SELECT events.event_name, video_calls.video_call_link
                FROM userevents
                JOIN events ON userevents.event_id = events.event_id
                JOIN video_calls ON userevents.event_id = video_calls.event_id AND userevents.user_id = video_calls.user_id
                WHERE userevents.user_id = %s AND video_calls.used = FALSE
                """, (user_id,))
                events = cursor.fetchall()

                return render_template('login_success.html', name=user_name, events=events)
            else:
                return render_template('index.html', message='Login failed')
    finally:
        connection.close()

if __name__ == '__main__':
    app.run(debug=True)
