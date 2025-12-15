# Hirafi

## 📱 Project Overview

**Hirafi** is a mobile application designed to seamlessly connect **clients** with **craftsmen** in their local area. The platform enables clients to easily discover, evaluate, and hire craftsmen, while allowing craftsmen to showcase their skills, manage service requests, and receive payments securely.

Hirafi focuses on simplifying service discovery, improving trust through ratings and profiles, and streamlining transactions through integrated communication and payment systems.

---

## 🎯 Objectives

* Help clients quickly find qualified craftsmen near them
* Enable craftsmen to present their expertise and grow their customer base
* Facilitate smooth service ordering, communication, and payments
* Provide a secure, scalable, and user‑friendly mobile experience

---

## 🧩 Core Features

### 1. User Authentication

* Secure login and registration
* Supports **email** and **phone number** authentication
* Separate user flows for **clients** and **craftsmen**

### 2. Craftsman Personal Archive

Each craftsman has a dedicated profile that includes:

* Specialty / profession
* Years of experience
* Client ratings and reviews
* Personal exhibition (portfolio of previous work)

### 3. Search & Filtering System

* Search craftsmen by **location** and **specialty**
* Filters for ratings and availability
* Optimized for fast and accurate results

### 4. Ordering & Hiring System

* Clients can post job offers
* Craftsmen can view and apply for available jobs
* Hiring status tracking (pending, accepted, completed)

### 5. Closed In‑App Chat

* Secure one‑to‑one chat between clients and craftsmen
* Used for job discussion, clarifications, and coordination

### 6. Online Payment System

* Integrated online payments
* Enables secure transactions between clients and craftsmen
* Reduces cash dependency and improves trust

### 7. Tools Marketplace

* Dedicated marketplace for craftsmen
* Buy and sell **new or used tools and kits**
* Supports browsing, listing, and purchasing tools

### 8. Rating & Review System

* Clients can rate craftsmen after job completion
* Ratings help maintain quality and transparency
* Encourages professionalism and service improvement

### 9. Real‑Time Notifications

* Instant notifications for:

  * New job offers
  * Messages
  * Application status updates
  * Platform announcements

---

## ⚙️ Technical Stack

### Frontend

* **Flutter** – Cross‑platform mobile application framework

### Backend

* **Firebase (BaaS)**

  * Firebase Authentication
  * Cloud Firestore
  * Firebase Cloud Functions
  * Firebase Cloud Messaging (FCM)

---

## 🧱 Architecture Overview

* Client‑side UI built with Flutter
* Backend services handled by Firebase
* Real‑time data synchronization using Firestore
* Event‑driven notifications using FCM

---

## 📄 Documentation

Detailed functional and non‑functional requirements are available in the **Specification Requirements Document**, which expands on:

* Data models
* User flows
* Security considerations
* Performance and scalability constraints

---

## 🚀 Project Status

* Current stage: **Prototype / UI-UX focused development**
* Backend and full functionality to be implemented after validation and approval

---

## 🛠️ Project Setup & Configuration

This section explains how to configure and run the project locally after pulling it from the repository.

### Prerequisites

Ensure you have the following installed on your system:

* **Flutter SDK** (stable channel)
* **Dart SDK** (included with Flutter)
* **Android Studio** or **VS Code** with Flutter & Dart plugins
* **Android Emulator** or a physical Android device
* **Firebase account**

---

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/hirafi.git
cd hirafi
```

---

### 2. Install Dependencies

Run the following command to fetch all Flutter dependencies:

```bash
flutter pub get
```

---

### 3. Firebase Configuration

Hirafi uses **Firebase as a Backend-as-a-Service (BaaS)**. You must configure Firebase manually for your environment.

#### a. Create a Firebase Project

* Go to the Firebase Console
* Create a new project

#### b. Register the App

* Add an **Android app** (and iOS if needed)
* Use your application package name

#### c. Download Firebase Configuration Files

* **Android:** Download `google-services.json`

  * Place it inside:

    ```
    android/app/google-services.json
    ```

* **iOS:** Download `GoogleService-Info.plist`

  * Place it inside:

    ```
    ios/Runner/GoogleService-Info.plist
    ```

---

### 4. Enable Firebase Services

Enable the following services from the Firebase Console:

* **Firebase Authentication**

  * Enable Email/Password authentication
  * Enable Phone authentication

* **Cloud Firestore**

  * Set database rules (development mode for testing)

* **Firebase Cloud Messaging (FCM)**

  * Enable notifications for real-time updates

(Optional, based on implementation stage)

* **Cloud Functions**
* **Firebase Storage**

---

### 5. Android Configuration

Ensure the following are added:

* In `android/build.gradle`

  ```gradle
  classpath 'com.google.gms:google-services:4.4.0'
  ```

* In `android/app/build.gradle`

  ```gradle
  apply plugin: 'com.google.gms.google-services'
  ```

---

### 6. Run the Application

Connect a device or start an emulator, then run:

```bash
flutter run
```

---

### 7. Common Issues

* Run `flutter doctor` to verify your environment
* Ensure Firebase config files are correctly placed
* Check package name consistency between Firebase and Flutter

---

## 📌 Future Enhancements

* Advanced recommendation system
* Subscription plans for premium craftsmen
* Admin dashboard for moderation and analytics
* Multi‑language support

---

## 👤 Author

**Lokman Hamidi**
CS Engineering Student | Software Engineer

---

## 🔗 Useful Links

* Flutter: [https://flutter.dev](https://flutter.dev)
* Firebase: [https://firebase.google.com](https://firebase.google.com)
* GitHub: [https://github.com/](https://github.com/)

---

> Hirafi aims to empower craftsmen and simplify access to trusted local services through modern mobile technology.
