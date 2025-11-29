import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:solusi/core/colors.dart';
import 'package:solusi/core/location_service.dart';

class LocationPermissionWidget extends StatefulWidget {
  const LocationPermissionWidget({super.key});

  @override
  State<LocationPermissionWidget> createState() => _LocationPermissionWidgetState();
}

class _LocationPermissionWidgetState extends State<LocationPermissionWidget> {
  final LocationService _locationService = LocationService.instance;
  LocationPermissionStatus? _status;
  Position? _currentPosition;
  bool _isLoading = false;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
  }

  Future<void> _checkPermissionStatus() async {
    setState(() => _isLoading = true);
    
    try {
      final status = await _locationService.getPermissionStatus();
      setState(() {
        _status = status;
        _message = _getStatusMessage(status);
      });
    } catch (e) {
      setState(() => _message = 'Error checking permission: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _requestPermission() async {
    setState(() => _isLoading = true);
    
    try {
      final result = await _locationService.requestLocationPermission();
      
      setState(() => _message = result.message);
      
      if (result.shouldOpenSettings) {
        _showSettingsDialog();
      } else if (result.success) {
        await _checkPermissionStatus();
        await _getCurrentLocation();
      }
    } catch (e) {
      setState(() => _message = 'Error requesting permission: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);
    
    try {
      final position = await _locationService.getCurrentPosition();
      setState(() {
        _currentPosition = position;
        if (position != null) {
          _message = 'Location obtained successfully!';
        } else {
          _message = 'Failed to get current location';
        }
      });
    } catch (e) {
      setState(() => _message = 'Error getting location: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String _getStatusMessage(LocationPermissionStatus status) {
    if (!status.serviceEnabled) {
      return '❌ Location service is disabled';
    }
    
    if (status.isDeniedForever) {
      return '❌ Location permission permanently denied';
    }
    
    if (status.isDenied) {
      return '⚠️ Location permission denied';
    }
    
    if (status.isGranted && !status.hasPreciseLocation) {
      return '⚠️ Location granted but not precise';
    }
    
    if (status.isFullyFunctional) {
      return '✅ Location permission fully functional';
    }
    
    return '❓ Unknown permission status';
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text(
          'This app needs location permission to work properly. Please enable it in Settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _locationService.openLocationSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.w),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location Permission Status',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'SemiBold',
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 16.h),
            
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else ...[
              // Status Info
              if (_status != null) ...[
                _buildStatusRow('Service Enabled', _status!.serviceEnabled),
                _buildStatusRow('Permission Granted', _status!.isGranted),
                _buildStatusRow('Precise Location', _status!.hasPreciseLocation),
                SizedBox(height: 12.h),
              ],
              
              // Message
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.grey10.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  _message,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.black2,
                  ),
                ),
              ),
              
              SizedBox(height: 16.h),
              
              // Current Location Info
              if (_currentPosition != null) ...[
                Text(
                  'Current Location:',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Medium',
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Lat: ${_currentPosition!.latitude.toStringAsFixed(6)}',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.grey2),
                ),
                Text(
                  'Lng: ${_currentPosition!.longitude.toStringAsFixed(6)}',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.grey2),
                ),
                Text(
                  'Accuracy: ${_currentPosition!.accuracy.toStringAsFixed(1)}m',
                  style: TextStyle(fontSize: 12.sp, color: AppColors.grey2),
                ),
                SizedBox(height: 16.h),
              ],
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _requestPermission,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Request Permission'),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _getCurrentLocation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green2,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Get Location'),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 8.h),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _checkPermissionStatus,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey10,
                    foregroundColor: AppColors.black,
                  ),
                  child: const Text('Refresh Status'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, bool status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              color: AppColors.black2,
            ),
          ),
          Icon(
            status ? Icons.check_circle : Icons.cancel,
            color: status ? Colors.green : Colors.red,
            size: 20.w,
          ),
        ],
      ),
    );
  }
}