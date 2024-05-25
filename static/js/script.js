// Get modal element
var modal = document.getElementById('legalModal');
var agreeButton = document.getElementById('agreeButton');
var closeButton = document.getElementsByClassName('close')[0];
var eventLinks = document.querySelectorAll('.event-link');

// Show the modal when the page loads
window.onload = function() {
    modal.style.display = 'flex';
}

// Close the modal when the user clicks on the "x" button
closeButton.onclick = function() {
    modal.style.display = 'none';
}

// Enable event links only after user agrees
agreeButton.onclick = function() {
    modal.style.display = 'none';
    eventLinks.forEach(function(link) {
        link.classList.add('enabled');
    });
}

// Initially disable event links
eventLinks.forEach(function(link) {
    link.classList.remove('enabled');
});
