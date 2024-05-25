import pymysql.cursors
import os
from dotenv import load_dotenv
import requests
import base64
from datetime import datetime
import pytz

# Load environment variables from .env file
load_dotenv()

def get_db_connection():
    return pymysql.connect(host=os.getenv('DB_HOST'),
                           user=os.getenv('DB_USER'),
                           password=os.getenv('DB_PASSWORD'),
                           db=os.getenv('DB_NAME'),
                           charset='utf8mb4',
                           cursorclass=pymysql.cursors.DictCursor)

def get_zoom_access_token():
    url = "https://zoom.us/oauth/token"
    headers = {
        "Authorization": "Basic " + base64.b64encode(f"{os.getenv('ZOOM_CLIENT_ID')}:{os.getenv('ZOOM_CLIENT_SECRET')}".encode()).decode(),
    }
    payload = {
        "grant_type": "account_credentials",
        "account_id": os.getenv('ZOOM_ACCOUNT_ID')
    }
    response = requests.post(url, headers=headers, data=payload)
    response_data = response.json()
    return response_data['access_token']

def create_zoom_meeting(event_date):
    token = get_zoom_access_token()
    url = "https://api.zoom.us/v2/users/me/meetings"
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }
    meeting_details = {
        'topic': 'Event Meeting',
        'type': 2,  # Scheduled meeting
        'start_time': event_date.strftime("%Y-%m-%dT%H:%M:%SZ"),
        'duration': 60,  # 1 hour
        'timezone': 'UTC',
        'settings': {
            'host_video': False,
            'participant_video': False,
            'join_before_host': True,
            'mute_upon_entry': True,
            'waiting_room': False,
        }
    }
    response = requests.post(url, headers=headers, json=meeting_details)
    return response.json()['join_url']

def generate_links():
    connection = get_db_connection()
    try:
        with connection.cursor() as cursor:
            # Get all users and their registered events
            sql = """
            SELECT users.id AS user_id, events.event_id AS event_id, events.event_date AS event_date
            FROM userevents
            JOIN users ON userevents.user_id = users.id
            JOIN events ON userevents.event_id = events.event_id
            """
            cursor.execute(sql)
            registrations = cursor.fetchall()

            for registration in registrations:
                user_id = registration['user_id']
                event_id = registration['event_id']
                event_date = registration['event_date']
                
                meeting_link = create_zoom_meeting(event_date)

                # Insert the meeting link into the database
                cursor.execute("INSERT INTO video_calls (user_id, event_id, video_call_link, used) VALUES (%s, %s, %s, %s)", 
                               (user_id, event_id, meeting_link, False))
                connection.commit()
    finally:
        connection.close()

if __name__ == '__main__':
    generate_links()
