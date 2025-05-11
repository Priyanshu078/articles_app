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
- Architecture: [Clean-Architecture]
- HTTP Client: [dio]
- Persistence: [shared_preferences]

## State Management Explanation
I have used Clean Architecture for architecting the app because it keeps the code modular, clean, and testable
Provider for state management because I didn't want to increase complexity by using Bloc or anything else.

## Known Issues / Limitations
No issues

## Screenshots
![simulator_screenshot_D37D06F0-F07F-48ED-A772-EC101106211B](https://github.com/user-attachments/assets/2c456a23-2d7e-4be1-8281-24c4547e0f0b)
[simulator_screenshot_06895E1A-857D-4E0F-B26F-28DE47EB3B52](https://github.com/user-attachments/assets/7c050e0d-00fb-4272-8015-5f1ca64fd03d)
![simulator_screenshot_F377806C-E129-4116-8C3B-C3931810F5AB](https://github.com/user-attachments/assets/656bf7a5-76ef-4ada-a58f-1ed03a442875)


