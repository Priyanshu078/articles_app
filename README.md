# Flutter Article App
A Flutter app that fetches and displays a list of articles from a public API.

## Features
- List of articles
- List of favorite articles
- Tab of (all/ favourite) articles
- save as favorite functionality
- remove from favorite functionality
- Search functionality
- Detail view
- Responsive UI


## Setup Instructions
1. Clone the repo:
git clone https://github.com/Priyanshu078/articles_app.git
cd articles_app

2. Install dependencies:
flutter pub get

3. Run the app:
flutter run

## Tech Stack
- Flutter SDK: [3.29.0]
- State Management: [Provider]
- Architecure: [Clean-Architecture]
- HTTP Client: [dio]
- Persistence: [shared_preferences]

## State Management Explanation
I have used Clean Architecure for architecting the app because it keeps the code modular, clean and testable
Provider for state management because I dont wanted to increase any complexity by using Bloc or anything else for state management.

## Known Issues / Limitations
No issues

## Screenshots (Optional)