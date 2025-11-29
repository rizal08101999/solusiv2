// ignore_for_file: avoid_print

import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:solusi/core/helper.dart';

class LocationService {
  static LocationService? _instance;
  static LocationService get instance => _instance ??= LocationService._();
  LocationService._();

  /// Request all necessary permissions for both platforms
  Future<Map<String, bool>> requestAllPermissions() async {
    final Map<String, bool> results = {};
    
    if (Platform.isIOS) {
      results['location'] = await requestIOSLocationPermission();
      results['preciseLocation'] = await requestIOSPreciseLocationPermission();
    } else {
      results['location'] = await requestAndroidLocationPermission();
      results['preciseLocation'] = true; // Android handles this automatically
    }
    
    return results;
  }

  /// Check if location service is enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Get current location with error handling
  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  /// Initialize location service and request permissions
  Future<bool> initialize() async {
    try {
      // Request permissions for both platforms
      final permissions = await requestAllPermissions();
      
      if (!permissions['location']!) {
        print('❌ Location permission denied');
        return false;
      }
      
      if (Platform.isIOS) {
        print('✅ iOS Location permissions granted');
        print('📍 Precise location: ${permissions['preciseLocation']}');
      } else {
        print('✅ Android Location permissions granted');
      }
      
      // Check if location service is enabled (both platforms)
      final serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('❌ Location service is disabled');
        return false;
      }
      
      print('✅ Location service initialized successfully');
      return true;
    } catch (e) {
      print('❌ Error initializing location service: $e');
      return false;
    }
  }

  /// Get current position with comprehensive error handling
  Future<Position?> getCurrentPosition() async {
    try {
      // Ensure service is initialized
      final initialized = await initialize();
      if (!initialized) return null;

      // Get current position
      final position = await getCurrentLocation();
      
      if (position != null) {
        print('📍 Current location: ${position.latitude}, ${position.longitude}');
        print('🎯 Accuracy: ${position.accuracy}m');
      }
      
      return position;
    } catch (e) {
      print('❌ Error getting current position: $e');
      return null;
    }
  }

  /// Check if user has granted precise location (iOS 14+) or high accuracy (Android)
  Future<bool> hasPreciseLocation() async {
    try {
      final position = await getCurrentLocation();
      if (position == null) return false;
      
      // If accuracy is very high (< 10m), likely has precise/high accuracy location
      return position.accuracy < 10.0;
    } catch (e) {
      return false;
    }
  }

  /// Open app settings if permission denied forever
  Future<void> openLocationSettings() async {
    try {
      await Geolocator.openAppSettings();
    } catch (e) {
      print('Error opening location settings: $e');
    }
  }

  /// Get location permission status
  Future<LocationPermissionStatus> getPermissionStatus() async {
    try {
      final permission = await Geolocator.checkPermission();
      final serviceEnabled = await isLocationServiceEnabled();
      
      return LocationPermissionStatus(
        permission: permission,
        serviceEnabled: serviceEnabled,
        hasPreciseLocation: await hasPreciseLocation(),
      );
    } catch (e) {
      return LocationPermissionStatus(
        permission: LocationPermission.denied,
        serviceEnabled: false,
        hasPreciseLocation: false,
      );
    }
  }

  /// Request location permission with user-friendly messages
  Future<LocationPermissionResult> requestLocationPermission() async {
    try {
      // Check if service is enabled
      final serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationPermissionResult(
          success: false,
          message: 'Location service is disabled. Please enable it in Settings.',
          shouldOpenSettings: true,
        );
      }

      // Check current permission
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.deniedForever) {
        return LocationPermissionResult(
          success: false,
          message: 'Location permission is permanently denied. Please enable it in Settings.',
          shouldOpenSettings: true,
        );
      }

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        
        if (permission == LocationPermission.denied) {
          return LocationPermissionResult(
            success: false,
            message: 'Location permission denied. This app needs location access to work properly.',
            shouldOpenSettings: false,
          );
        }
        
        if (permission == LocationPermission.deniedForever) {
          return LocationPermissionResult(
            success: false,
            message: 'Location permission is permanently denied. Please enable it in Settings.',
            shouldOpenSettings: true,
          );
        }
      }

      // Platform specific: Request precise/high accuracy location if needed
      if (Platform.isIOS) {
        final preciseGranted = await requestIOSPreciseLocationPermission();
        if (!preciseGranted) {
          return LocationPermissionResult(
            success: true,
            message: 'Location permission granted, but precise location is not available. Some features may be limited.',
            shouldOpenSettings: false,
          );
        }
      }
      // Android automatically uses high accuracy if available

      return LocationPermissionResult(
        success: true,
        message: 'Location permission granted successfully.',
        shouldOpenSettings: false,
      );
      
    } catch (e) {
      return LocationPermissionResult(
        success: false,
        message: 'Error requesting location permission: $e',
        shouldOpenSettings: false,
      );
    }
  }
}

class LocationPermissionStatus {
  final LocationPermission permission;
  final bool serviceEnabled;
  final bool hasPreciseLocation;

  LocationPermissionStatus({
    required this.permission,
    required this.serviceEnabled,
    required this.hasPreciseLocation,
  });

  bool get isGranted => permission == LocationPermission.always || 
                       permission == LocationPermission.whileInUse;
  
  bool get isDenied => permission == LocationPermission.denied;
  
  bool get isDeniedForever => permission == LocationPermission.deniedForever;
  
  bool get isFullyFunctional => isGranted && serviceEnabled;
  
  bool get hasHighAccuracy => isGranted && serviceEnabled && hasPreciseLocation;
}

class LocationPermissionResult {
  final bool success;
  final String message;
  final bool shouldOpenSettings;

  LocationPermissionResult({
    required this.success,
    required this.message,
    required this.shouldOpenSettings,
  });
}