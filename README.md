# 📝 ToDo App - Flutter

A Flutter To-Do application that helps users manage their daily tasks efficiently.  
This project integrates **Firebase Authentication, Cloud Firestore, and Cloudinary** to provide a modern and scalable solution.

---

## ✨ Features
- 🔐 User authentication using **Firebase Auth** (Sign Up, Login, Logout)
- ☁️ Store tasks in **Cloud Firestore Database** for real-time sync
- 📁 Upload and manage media files (images, videos, etc.) with **Cloudinary**
- ✅ Add, edit, mark as complete/incomplete, and delete tasks
- 💾 Persistent local storage with **SharedPreferences** for offline mode
- 🎨 Simple and clean UI built with Flutter

---

## 🛠️ Technologies Used
- [Flutter](https://flutter.dev/) (Dart SDK)
- [Firebase Auth](https://firebase.google.com/docs/auth)
- [Cloud Firestore](https://firebase.google.com/docs/firestore)
- [Cloudinary](https://cloudinary.com/)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)

---

## 🎥 Demo Video
> **Note**: The demo video (44MB) is available in the
[IMG_9621.MOV](../../Users/mohamedyaser/Downloads/IMG_9621.MOV)
## ⚙️ Installation

### Prerequisites
- Flutter SDK: [Flutter installation guide](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Visual Studio Code: [Download VS Code](https://code.visualstudio.com/)
- Firebase project setup

### Steps
1. **Clone the repository**
   ```bash
   git clone https://github.com/username/todooappnit.git
   cd todooappnit
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Add your Flutter app to the project
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories:
      - `android/app/google-services.json`
      - `ios/Runner/GoogleService-Info.plist`

4. **Cloudinary Setup**
   - Create account at [Cloudinary](https://cloudinary.com)
   - Get your API credentials
   - Add them to your app configuration

5. **Run the app**
   ```bash
   flutter run
   ```



