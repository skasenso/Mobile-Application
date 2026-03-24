# Campus Connect - Valley View University

Campus Connect is a social-style mobile application built for Valley View University students. It allows students to stay informed about campus events, share their own events, and interact with the community.

## Features

- **Firebase Authentication**: Secure sign-up and login using email and password.
- **Campus Events**: Real-time list of events fetched from Cloud Firestore.
- **Add Events**: Users can create new events with:
  - Title & Description
  - Date selection
  - Photo capture (Device Camera)
  - GPS Location tagging
- **Interactions**:
  - Like events (Local and Firestore synchronization).
  - Real-time commenting on events.
- **Motivation**: Fetches a random motivational quote daily from a REST API.
- **User Profile**: View account details and log out safely.
- **Bonus Features**:
  - **Delete Events**: Users can delete events they created.
  - **Dark Mode**: Support for system-wide dark and light themes.

## Tech Stack

- **Flutter**: UI Framework
- **Firebase Auth**: Authentication
- **Cloud Firestore**: Real-time Database
- **Provider**: State Management (MVVM Pattern)
- **Http**: REST API integration (Quotable API)
- **Device APIs**: `image_picker` (Camera) and `geolocator` (GPS)

## Setup Instructions

### 1. Firebase Configuration
This project requires a Firebase project to be set up.
1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable **Email/Password Authentication**.
3. Create a **Cloud Firestore** database and set rules for access.
4. Download the configuration files:
   - Android: `google-services.json` (place in `android/app/`)
   - iOS: `GoogleService-Info.plist` (place in `ios/Runner/`)
5. Alternatively, update `lib/firebase_options.dart` with your project's API keys and IDs.

### 2. Run the Project
```bash
flutter pub get
flutter run
```

## Challenges Faced
- Managing real-time streams with `Provider` required careful lifecycle management.
- Integrating device APIs like GPS required handling various permission states across Android/iOS.
- Implementing a robust MVVM architecture ensures the app remains scalable for future capstone extensions.

---
Built for **INFT 425 – Mobile Application Development**
Instructor: Prof. Dr. Prince Owusu Amoako
Assistant: Mr. Kobbina Amoah
