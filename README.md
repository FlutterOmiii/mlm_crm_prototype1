# SellerStack - An Operating System for MLM / Direct Sellers

A production-ready mobile application built with Flutter, designed to scale to 1M+ users. SellerStack is a comprehensive CRM system for MLM and direct selling professionals.

## 🚀 Features

### Core Functionality
- **Multi-Language Support**: English, Hindi, Marathi, and Hinglish
- **Dark & Light Themes**: System-based and manual theme switching
- **OTP Authentication**: Secure phone-based login
- **Lead Management**: Full CRUD operations for managing leads
- **Follow-up System**: WhatsApp deep linking and call integration
- **Training Modules**: Static content for seller education
- **Profile Management**: User profile and settings

### Technical Highlights
- **Architecture**: MVVM with feature-based folder structure
- **State Management**: GetX for routing, state, and dependency injection
- **Responsive UI**: Adapted for all screen sizes with ScreenUtil
- **Clean Code**: SOLID principles and maintainable architecture
- **Performance**: Optimized for low-end devices

## 📁 Project Structure

```
lib/
├── app/
│   ├── core/
│   │   ├── bindings/         # Global dependency injection
│   │   ├── constants/        # App-wide constants
│   │   ├── localization/     # Multi-language support
│   │   ├── routes/           # GetX navigation routes
│   │   ├── theme/            # Light & dark themes
│   │   └── utils/            # Validators and utilities
│   ├── data/
│   │   ├── models/           # Data models
│   │   ├── providers/        # API providers
│   │   └── repositories/     # Data repositories
│   ├── modules/              # Feature modules
│   │   ├── splash/
│   │   ├── language_selection/
│   │   ├── auth/
│   │   ├── home/
│   │   ├── leads/
│   │   ├── followups/
│   │   ├── training/
│   │   └── profile/
│   └── widgets/
│       └── common/           # Reusable widgets
└── main.dart
```

## 🛠️ Tech Stack

- **Flutter**: Latest stable (SDK 3.7.2+)
- **GetX**: State management, routing, and dependency injection
- **ScreenUtil**: Responsive UI adaptation
- **GetStorage**: Local data persistence
- **URL Launcher**: Deep linking for WhatsApp and calls
- **Material 3**: Modern UI components

## 🚦 Getting Started

### Prerequisites
- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository
2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 🎨 Features Overview

### 1. Splash & Language Selection
- Smooth animated splash screen
- First-time language selection
- Persists user preference

### 2. Authentication
- Phone number-based OTP login
- OTP verification with resend timer
- Secure session management

### 3. Home Dashboard
- Earnings overview with gradients
- Quick stats (leads, follow-ups)
- Quick actions for common tasks
- Recent activity feed

### 4. Lead Management
- Create, Read, Update, Delete leads
- Status tracking (New, Contacted, Interested, etc.)
- Lead details with contact options
- WhatsApp and call integration

### 5. Follow-ups
- Schedule follow-ups
- WhatsApp integration
- Direct call functionality
- Follow-up reminders

### 6. Training
- Multiple training modules
- Progress tracking
- Structured learning paths

### 7. Profile & Settings
- User profile management
- Theme switching (Light/Dark)
- Language preferences
- Notification settings

## 🌍 Supported Languages

- **English** (en_US)
- **Hindi** (hi_IN)
- **Marathi** (mr_IN)
- **Hinglish** (hinglish)

## 🏗️ Architecture

Built using MVVM architecture with GetX for state management. The project follows a feature-based folder structure with clear separation of concerns.

---

Built with ❤️ using Flutter
