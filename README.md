# Solusi

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

### iOS Permissions

This application requires specific permissions on iOS for full functionality:

1. **Location Permission**: Required for attendance tracking and location-based services
2. **Biometric Authentication (Face ID/Touch ID)**: Used for secure user authentication
3. **Internet Access**: Needed for network requests to external services
4. **App Tracking Transparency**: Requests user permission for tracking activities

All permissions are properly configured in `ios/Runner/Info.plist` and helper functions are available in `lib/core/helper.dart`.

For detailed information about iOS permissions, see [IOS_PERMISSIONS.md](IOS_PERMISSIONS.md).

## Development Setup

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
