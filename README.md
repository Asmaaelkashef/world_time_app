🌍 World Time App

A Flutter application that displays world timezones and their current time details.

## Features
- Browse all available timezones
- View current date, time, and UTC offset for any timezone
- Loading, error, and empty states
- Pull-to-refresh support

## Tech Stack
- Flutter
- Dio (HTTP requests)
- Flutter BLoC (state management)

Architecture
lib/
├── models/
│   ├── timezone_model.dart
│   └── world_time_model.dart
├── services/
│   └── time_service.dart
├── cubits/
│   ├── timezone/
│   │   ├── timezone_cubit.dart
│   │   └── timezone_state.dart
│   └── time_detail/
│       ├── time_detail_cubit.dart
│       └── time_detail_state.dart
└── screens/
    ├── home_page.dart
    └── details_page.dart


 API
This app uses [TimeAPI](https://timeapi.io) to fetch timezone data.

Getting Started
1. Clone the repo
2. Run `flutter pub get`
3. Run `flutter run`
