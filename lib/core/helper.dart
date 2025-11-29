// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:solusi/core/local_db.dart';

final log = Logger();
final LocalAuthentication auth = LocalAuthentication();
const baseUrl = "https://lotusku.com/apimobile/";
final formatedateapi = DateFormat('yyyy-MM-dd');

dynamic extractDynamicData(dynamic data, String? dataKey) {
  if (data == null) return null;

  // Jika API mengirim List langsung
  if (data is List) {
    return data;
  }

  // Jika API mengirim Map → cek dataKey
  if (data is Map) {
    if (dataKey != null && data.containsKey(dataKey)) {
      return data[dataKey];
    }

    // Jika hanya punya satu field → auto ambil
    if (data.length == 1) {
      return data.values.first;
    }

    return data;
  }

  return data;
}



Future<T?> handleApiResponse<T>({
  required int? statusCode,
  required Map<String, dynamic> json,
  Future<T> Function(dynamic)? fromJson,
  Future<void> Function(T)? onSuccess,
  Future<void> Function(String)? onSuccessMsg,
  Future<void> Function(String)? onFail,
  Future<void> Function()? onBadResponse,
  String? defaultErrorMsg,
  String? dataKey,
  Future<void> Function()? onUnauthorized,
}) async {
  print("statusCode: $statusCode");
  switch (statusCode) {
    case 200:
      if (json['error'] == true) {
        await onFail?.call(json['message'] ?? defaultErrorMsg ?? "Terjadi kesalahan.");
        return null;
      } else {
        final dataContainer = json['data'];
        final raw = extractDynamicData(dataContainer, dataKey);

        if (fromJson != null) {
          final data = await fromJson(raw);
          await onSuccess?.call(data);
          return data;
        } 
        else if (onSuccessMsg != null) {
          await onSuccessMsg.call(json['message'] ?? "Berhasil.");
          return null;
        } 
        else {
          await onSuccess?.call(raw as T);
          return null;
        }
      }
    case 201:
      if (json['error'] == true) {
        await onFail?.call(json['message'] ?? defaultErrorMsg ?? "Terjadi kesalahan.");
        return null;
      } else {
        if (fromJson != null) {
          final data = await fromJson(json['data']);
          await onSuccess?.call(data);
          return data;
        } else if (onSuccessMsg != null) {
          await onSuccessMsg.call(json['message'] ?? "Berhasil.");
          return null;
        } else {
          await onSuccess?.call(json as T);
          return null;
        }
      }
    case 400:
      print("objectku");
      await onBadResponse?.call();
      return null;
    case 401:
      if (onUnauthorized != null) {
        await onUnauthorized.call();
        return null;
      }
      await onFail?.call(json['message'] ?? "Tidak diizinkan.");
      return null;
    case 404:
      await onFail?.call(json['message'] ?? "Data tidak ditemukan.");
      return null;
    default:
      await onFail?.call(defaultErrorMsg ?? "Terjadi kesalahan.");
      return null;
  }
}

class DioClient {
  late Dio dio;

  DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      contentType: Headers.formUrlEncodedContentType
    );

    dio = Dio(options);

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (obj) => log.i(obj),
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await getToken(); 
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        log.e("API Error", error: e, stackTrace: e.stackTrace);
        return handler.next(e);
      },
    ));
  }

  Future<String?> getToken() async {
    if (LocalDB.getToken() != null) {
      return LocalDB.getToken()!;
    } else {
      return null;
    }
  }

  Future<Response> postMultipart({
    required String path,
    required Map<String, dynamic> fields,
    required List<MultipartFile> files,
    required List<String> filePaths,
    required String paramsimage,
  }) async {
    final formData = FormData();

    fields.forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    for (int i = 0; i < files.length; i++) {
      formData.files.add(MapEntry('$paramsimage[$i]', files[i]));
    }

    return await dio.post(
      path,
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );
  }
}

Future<String?> getDeviceId() async {
  const platform = MethodChannel('device/info');
  try {
    return await platform.invokeMethod('deviceId');
  } catch (e) {
    return '';
  }
}

Future<void> startTrackingDelivery(String shipmentId) async {
  const MethodChannel channel = MethodChannel('location/channel');
  try {
    final result = await channel.invokeMethod('startTracking', {
      'shipmentId': shipmentId,
    });
    print("Service started: $result");
  } on PlatformException catch (e) {
    print("Failed to start tracking: ${e.message}");
  }
}

Future<void> stopTrackingDelivery() async {
  const MethodChannel channel = MethodChannel('location/channel');
  try {
    final result = await channel.invokeMethod('stopTracking',);
    print("Service stopped: $result");
  } on PlatformException catch (e) {
    print("Failed to stopped tracking: ${e.message}");
  }
}

Future<bool> authenticate() async {
  try {
    final bool canCheckBiometrics = await auth.canCheckBiometrics;
    final bool isDeviceSupported = await auth.isDeviceSupported();
    
    if (!canCheckBiometrics && !isDeviceSupported) {
      print("⚠️ Device tidak support biometrik");
      return false;
    }

    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    
    if (availableBiometrics.isEmpty) {
      print("⚠️ Tidak ada biometrik yang tersedia");
      return false;
    }

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        print("📱 Face ID tersedia");
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        print("👆 Touch ID tersedia");
      }
    } else if (Platform.isAndroid) {
      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        print("👆 Fingerprint tersedia");
      }
      if (availableBiometrics.contains(BiometricType.face)) {
        print("📱 Face Recognition tersedia");
      }
      if (availableBiometrics.contains(BiometricType.iris)) {
        print("👁️ Iris Scanner tersedia");
      }
    }

    final bool didAuthenticate = await auth.authenticate(
      localizedReason: 'Harap verifikasi identitas Anda untuk melanjutkan',
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );

    if (didAuthenticate) {
      print("✅ Autentikasi berhasil");
      return true;
    } else {
      print("❌ Autentikasi gagal atau dibatalkan");
      return false;
    }
  } on PlatformException catch (e) {
    print("❌ Platform Exception: ${e.message}");
    return false;
  } catch (e) {
    print("❌ Error: $e");
    return false;
  }
}

/// Check biometric availability and types for both iOS and Android
Future<Map<String, dynamic>> checkBiometricAvailability() async {
  try {
    final bool canCheckBiometrics = await auth.canCheckBiometrics;
    final bool isDeviceSupported = await auth.isDeviceSupported();
    final List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    
    // Platform-specific biometric detection
    Map<String, dynamic> result = {
      'canCheckBiometrics': canCheckBiometrics,
      'isDeviceSupported': isDeviceSupported,
      'availableBiometrics': availableBiometrics,
      'platform': Platform.isIOS ? 'iOS' : 'Android',
    };
    
    if (Platform.isIOS) {
      result.addAll({
        'hasFaceID': availableBiometrics.contains(BiometricType.face),
        'hasTouchID': availableBiometrics.contains(BiometricType.fingerprint),
        'hasIris': false, // iOS doesn't support iris
        'supportedTypes': _getIOSSupportedTypes(availableBiometrics),
      });
    } else if (Platform.isAndroid) {
      result.addAll({
        'hasFaceID': availableBiometrics.contains(BiometricType.face),
        'hasTouchID': availableBiometrics.contains(BiometricType.fingerprint),
        'hasIris': availableBiometrics.contains(BiometricType.iris),
        'supportedTypes': _getAndroidSupportedTypes(availableBiometrics),
      });
    } else {
      result.addAll({
        'hasFaceID': false,
        'hasTouchID': false,
        'hasIris': false,
        'supportedTypes': [],
      });
    }
    
    return result;
  } catch (e) {
    return {
      'canCheckBiometrics': false,
      'isDeviceSupported': false,
      'availableBiometrics': <BiometricType>[],
      'hasFaceID': false,
      'hasTouchID': false,
      'hasIris': false,
      'platform': Platform.isIOS ? 'iOS' : 'Android',
      'supportedTypes': [],
      'error': e.toString(),
    };
  }
}

/// Get iOS supported biometric types
List<String> _getIOSSupportedTypes(List<BiometricType> availableBiometrics) {
  List<String> types = [];
  if (availableBiometrics.contains(BiometricType.face)) {
    types.add('Face ID');
  }
  if (availableBiometrics.contains(BiometricType.fingerprint)) {
    types.add('Touch ID');
  }
  return types;
}

/// Get Android supported biometric types
List<String> _getAndroidSupportedTypes(List<BiometricType> availableBiometrics) {
  List<String> types = [];
  if (availableBiometrics.contains(BiometricType.fingerprint)) {
    types.add('Fingerprint');
  }
  if (availableBiometrics.contains(BiometricType.face)) {
    types.add('Face Recognition');
  }
  if (availableBiometrics.contains(BiometricType.iris)) {
    types.add('Iris Scanner');
  }
  return types;
}

/// Authenticate with custom options
Future<bool> authenticateWithOptions({
  String? localizedReason,
  bool biometricOnly = true,
  bool stickyAuth = true,
}) async {
  try {
    final biometricInfo = await checkBiometricAvailability();
    
    if (!biometricInfo['canCheckBiometrics'] && !biometricInfo['isDeviceSupported']) {
      throw Exception('Device tidak mendukung autentikasi biometrik');
    }

    if ((biometricInfo['availableBiometrics'] as List).isEmpty) {
      throw Exception('Tidak ada biometrik yang terdaftar di device');
    }

    String reason = localizedReason ?? 'Harap verifikasi identitas Anda untuk melanjutkan';
    
    if (Platform.isIOS) {
      if (biometricInfo['hasFaceID']) {
        reason = localizedReason ?? 'Gunakan Face ID untuk verifikasi';
      } else if (biometricInfo['hasTouchID']) {
        reason = localizedReason ?? 'Gunakan Touch ID untuk verifikasi';
      }
    } else if (Platform.isAndroid) {
      if (biometricInfo['hasFaceID']) {
        reason = localizedReason ?? 'Gunakan Face Recognition untuk verifikasi';
      } else if (biometricInfo['hasTouchID']) {
        reason = localizedReason ?? 'Gunakan Fingerprint untuk verifikasi';
      } else if (biometricInfo['hasIris']) {
        reason = localizedReason ?? 'Gunakan Iris Scanner untuk verifikasi';
      }
    }

    final bool didAuthenticate = await auth.authenticate(
      localizedReason: reason,
      options: AuthenticationOptions(
        biometricOnly: biometricOnly,
        stickyAuth: stickyAuth,
      ),
    );

    return didAuthenticate;
  } on PlatformException catch (e) {
    switch (e.code) {
      case 'NotAvailable':
        throw Exception('Autentikasi biometrik tidak tersedia');
      case 'NotEnrolled':
        throw Exception('Tidak ada biometrik yang terdaftar');
      case 'LockedOut':
        throw Exception('Autentikasi terkunci karena terlalu banyak percobaan');
      case 'PermanentlyLockedOut':
        throw Exception('Autentikasi terkunci permanen');
      case 'UserCancel':
        throw Exception('Autentikasi dibatalkan oleh user');
      case 'UserFallback':
        throw Exception('User memilih fallback method');
      case 'SystemCancel':
        throw Exception('Autentikasi dibatalkan oleh sistem');
      case 'InvalidContext':
        throw Exception('Context autentikasi tidak valid');
      case 'NotInteractive':
        throw Exception('Autentikasi tidak dapat dilakukan dalam mode non-interaktif');
      default:
        throw Exception('Error autentikasi: ${e.message}');
    }
  } catch (e) {
    throw Exception('Error tidak terduga: $e');
  }
}

/// Quick authentication for attendance
Future<bool> authenticateForAttendance() async {
  return await authenticateWithOptions(
    localizedReason: 'Verifikasi untuk absensi',
    biometricOnly: true,
    stickyAuth: true,
  );
}

Future<List<HolidayEntity>> fetchHolidays() async {
  List<HolidayEntity> result = [];
  try {
    var response = await http.get(Uri.parse("https://api-harilibur.vercel.app/api"));
    print("Raw Response Body: ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data is List) {
        LocalDB.holiday = List.from(data).map((e) => HolidayEntity.fromJson(e)).toList();
        result = List.from(data).map((e) => HolidayEntity.fromJson(e)).toList();
        print(result);
        return result;
      } else {
        print("Unexpected response format: $data");
      }
    }
  } catch (e) {
    print("Error fetching holidays: $e");
  }
  return [];
}

class HolidayEntity {
    String holidayDate;
    String holidayName;
    bool isNationalHoliday;

    HolidayEntity({
        required this.holidayDate,
        required this.holidayName,
        required this.isNationalHoliday,
    });

    factory HolidayEntity.fromJson(Map<String, dynamic> json) => HolidayEntity(
        holidayDate: json["holiday_date"],
        holidayName: json["holiday_name"],
        isNationalHoliday: json["is_national_holiday"],
    );

    Map<String, dynamic> toJson() => {
        "holiday_date": holidayDate,
        "holiday_name": holidayName,
        "is_national_holiday": isNationalHoliday,
    };
}

/// Request location permission for iOS
Future<bool> requestIOSLocationPermission() async {
  if (!Platform.isIOS) return false;
  
  var status = await Permission.locationWhenInUse.status;
  
  if (status.isDenied || status.isRestricted) {
    status = await Permission.locationWhenInUse.request();
  }
  
  if (status.isGranted) {
    var alwaysStatus = await Permission.locationAlways.status;
    if (alwaysStatus.isDenied) {
      await Permission.locationAlways.request();
    }
  }
  
  return status.isGranted;
}

/// Request precise location permission for iOS 14+
Future<bool> requestIOSPreciseLocationPermission() async {
  if (!Platform.isIOS) return false;
  
  try {
    final hasBasicPermission = await requestIOSLocationPermission();
    if (!hasBasicPermission) return false;
    
    final preciseStatus = await Permission.locationWhenInUse.status;
    return preciseStatus.isGranted;
  } catch (e) {
    print('Error requesting precise location: $e');
    return false;
  }
}

/// Request biometric permission for iOS (Face ID/Touch ID)
Future<bool> requestIOSBiometricPermission() async {
  if (!Platform.isIOS) return false;
  
  try {
    final biometricInfo = await checkBiometricAvailability();
    if (!biometricInfo['canCheckBiometrics'] && !biometricInfo['isDeviceSupported']) {
      return false;
    }
    
    return biometricInfo['hasFaceID'] || biometricInfo['hasTouchID'];
  } catch (e) {
    print('Error checking biometric permission: $e');
    return false;
  }
}

/// Request tracking permission for iOS (App Tracking Transparency)
Future<bool> requestIOSTrackingPermission() async {
  if (!Platform.isIOS) return false;
  
  final TrackingStatus status = await AppTrackingTransparency.trackingAuthorizationStatus;
  
  if (status == TrackingStatus.notDetermined) {
    final TrackingStatus status = await AppTrackingTransparency.requestTrackingAuthorization();
    return status == TrackingStatus.authorized;
  }
  
  return status == TrackingStatus.authorized;
}

/// Request location permission for Android
Future<bool> requestAndroidLocationPermission() async {
  if (!Platform.isAndroid) return false;
  
  var status = await Permission.locationWhenInUse.status;
  if (status.isDenied) {
    status = await Permission.locationWhenInUse.request();
  }
  
  return status.isGranted;
}