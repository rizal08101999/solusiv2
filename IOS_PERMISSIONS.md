# iOS Permissions Documentation

## Overview
This document describes the iOS permissions that have been added to the Solusi application to ensure proper functionality on iOS devices.

## Permissions Added

### 1. Location Permission
- **Purpose**: Access device location for attendance tracking and location-based services
- **Usage Description**: 
  - `NSLocationWhenInUseUsageDescription`: Used when the app is in use
  - `NSLocationAlwaysUsageDescription`: Used even when the app is in background
  - `NSLocationAlwaysAndWhenInUseUsageDescription`: Combined usage for background and foreground
- **Status**: ✅ Already implemented in Info.plist

### 2. Biometric Authentication Permission (Face ID/Touch ID)
- **Purpose**: Secure user authentication using biometrics
- **Usage Description**: `NSFaceIDUsageDescription`
- **Status**: ✅ Already implemented in Info.plist

### 3. Internet/App Transport Security
- **Purpose**: Allow network requests to external services
- **Usage Description**: `NSAppTransportSecurity` with `NSAllowsArbitraryLoads`
- **Status**: ✅ Added to Info.plist

### 4. App Tracking Transparency (ATT)
- **Purpose**: Request user permission for tracking activities
- **Usage Description**: `NSUserTrackingUsageDescription`
- **Status**: ✅ Added to Info.plist
- **Implementation**: Using `app_tracking_transparency` package

## Implementation Details

### Helper Functions
Added utility functions in `lib/core/helper.dart`:
- `requestIOSLocationPermission()`
- `requestIOSBiometricPermission()`
- `requestIOSTrackingPermission()`
- `requestAllIOSPermissions()`

### Dependencies
Added to `pubspec.yaml`:
- `app_tracking_transparency: ^2.0.6`

### iOS Configuration
Updated files:
- `Info.plist`: Added tracking permission descriptions
- `Podfile`: Configured iOS deployment target
- `Runner.entitlements`: Added biometric authentication entitlements
- `AppDelegate.swift`: Imported ATT framework

## Usage Example
```dart
// Request all iOS permissions at app startup
if (Platform.isIOS) {
  final permissions = await requestAllIOSPermissions();
  print('Location: ${permissions['location']}');
  print('Biometric: ${permissions['biometric']}');
  print('Tracking: ${permissions['tracking']}');
}
```

## Testing
To test these permissions:
1. Run the app on iOS simulator or device
2. Check permission dialogs appear as expected
3. Verify functionality works when permissions are granted
4. Handle cases when permissions are denied appropriately

## Notes
- All permissions are requested only on iOS platform
- Permission requests are handled gracefully with fallbacks
- Users can change permissions later in iOS Settings