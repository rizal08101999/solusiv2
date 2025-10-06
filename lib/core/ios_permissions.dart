import 'dart:io' show Platform;
import 'package:permission_handler/permission_handler.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class IOSPermissions {
  /// Request location permission for iOS
  static Future<bool> requestLocationPermission() async {
    if (!Platform.isIOS) return false;
    
    var status = await Permission.locationWhenInUse.status;
    if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
    }
    
    return status.isGranted;
  }
  
  /// Request biometric permission for iOS (Face ID/Touch ID)
  static Future<bool> requestBiometricPermission() async {
    if (!Platform.isIOS) return false;
    
    var status = await Permission.sensors.status;
    if (status.isDenied) {
      status = await Permission.sensors.request();
    }
    
    return status.isGranted;
  }
  
  /// Request tracking permission for iOS (App Tracking Transparency)
  static Future<bool> requestTrackingPermission() async {
    if (!Platform.isIOS) return false;
    
    // Check if we can show tracking authorization
    final TrackingStatus status = await AppTrackingTransparency.trackingAuthorizationStatus;
    
    if (status == TrackingStatus.notDetermined) {
      // Request tracking permission
      final TrackingStatus status = await AppTrackingTransparency.requestTrackingAuthorization();
      return status == TrackingStatus.authorized;
    }
    
    return status == TrackingStatus.authorized;
  }
  
  /// Request all necessary permissions for iOS
  static Future<Map<String, bool>> requestAllPermissions() async {
    if (!Platform.isIOS) {
      return {
        'location': false,
        'biometric': false,
        'tracking': false,
      };
    }
    
    final bool locationGranted = await requestLocationPermission();
    final bool biometricGranted = await requestBiometricPermission();
    final bool trackingGranted = await requestTrackingPermission();
    
    return {
      'location': locationGranted,
      'biometric': biometricGranted,
      'tracking': trackingGranted,
    };
  }
}