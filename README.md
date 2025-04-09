Meeting Scheduler (Terminal-Based - Haskell)
Welcome to the Fabulous Meeting Scheduler, a sleek terminal-based Haskell application that helps you easily plan and manage meetings. Whether you’re organizing a team catch-up, project discussion, or a casual sync, this CLI tool makes scheduling simple and interactive!

🚀 Features
🗓️ Schedule meetings with title, date, time, and participants

👥 Add multiple participants using comma-separated input

📋 View a list of all scheduled meetings with elegant formatting

💬 Interactive and user-friendly interface

📌 Stores multiple meetings within the session

🛠 Installation & Setup
📦 Prerequisites
Install the Haskell Tool Stack:

bash
Copy
Edit
curl -sSL https://get.haskellstack.org/ | sh
💻 Running the Application
Save the Code:

Save the above Haskell code into a file named MeetingScheduler.hs.

Run using GHCi:

bash
Copy
Edit
ghci MeetingScheduler.hs
main
Or, for a Stack-based project:

bash
Copy
Edit
stack new meeting-scheduler simple
cd meeting-scheduler
Replace app/Main.hs with the contents of MeetingScheduler.hs, then:

bash
Copy
Edit
stack build
stack exec meeting-scheduler-exe
🖥️ Usage
Once launched, the app will present you with options:

pgsql
Copy
Edit
What would you like to do?
1. Schedule a new meeting
2. View scheduled meetings
3. Exit
Just follow the prompts to enter:

Meeting Title

Date (e.g., 2025-04-08)

Time (e.g., 11:00 AM)

Participants (comma-separated list like Alice, Bob, Charlie)

The app stores and displays the meetings in a clean bordered format.

🧾 Example Output
yaml
Copy
Edit
--------------------------------------------------
| 1. Title: Project Sync
| Date: 2025-04-09
| Time: 10:30 AM
| Participants: Alice, Bob, Charlie
--------------------------------------------------
📁 Project Structure
bash
Copy
Edit
MeetingScheduler.hs     # Main Haskell source code
README.md               # Documentation for the project
🌟 Possible Enhancements
Persistent storage to save meetings between sessions

Integration with calendar APIs (Google Calendar, Outlook, etc.)

Notification/reminder support

Search and filter functionality

Terminal UI with colors and menus
