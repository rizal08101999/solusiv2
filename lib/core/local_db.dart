// ignore_for_file: unused_element, prefer_conditional_assignment

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solusi/core/helper.dart';

import '../app/modules/login/models/login_models.dart';


//ini digunakan untuk menyimpan data di lokal android menggunakan shared preferences
class LocalDB {
  static SharedPreferences? _prefs;

  /// Inisialisasi SharedPreferences
  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  /// Pastikan `_prefs` sudah diinisialisasi sebelum digunakan
  static Future<void> _ensureInitialized() async {
    if (_prefs == null) {
      throw Exception("LocalDB belum diinisialisasi. Pastikan untuk memanggil `await LocalDB.init()` sebelum mengakses properti atau metode.");
    }
  }

  // --- Properti dan Metode ---
  
  static set user(UserEntity? user) {
    final userString = user?.toJson();
    _prefs!.setString('user', jsonEncode(userString));
  }

  static UserEntity? get user {
    final userString = _prefs!.getString('user').toString();
    if (userString != 'null') {
      return UserEntity.fromJson(jsonDecode(userString));
    } else {
      return null;
    }
  }

  static set holiday(List<HolidayEntity>? holidays) {
    if (holidays != null) {
      final jsonList = holidays.map((e) => e.toJson()).toList();
      _prefs!.setString('holiday', jsonEncode(jsonList));
    } else {
      _prefs!.remove('holiday');
    }
  }

  static List<HolidayEntity>? get holiday {
    final holidayString = _prefs!.getString('holiday');
    if (holidayString != null) {
      final List<dynamic> decoded = jsonDecode(holidayString);
      return decoded.map((e) => HolidayEntity.fromJson(e)).toList();
    }
    return null;
  }

  static void setFirstTime(bool isFirstTime) {
    _prefs?.setBool('isFirstTime', isFirstTime);
  }

  static bool get isFirstTime {
    return _prefs?.getBool('isFirstTime') ?? true;
  }

  static setToken(String token) {
    _prefs?.setString('token', token);
  }

  static String? getToken() {
    return _prefs?.getString('token');
  }

  static setDeviceId(String id) {
    _prefs?.setString('deviceId', id);
  }

  static String? getDeviceId() {
    return _prefs?.getString('deviceId');
  }

  static void setIdShipment(String id) {
    _prefs?.setString('idShipment', id);
  }

  static String? getIdShipment() {
    return _prefs?.getString('idShipment');
  }

  static void setisDone(String done) {
    _prefs?.setString('is_done', done);
  }

  static String? getisDone() {
    return _prefs?.getString('is_done');
  }

  static void removeToken() {
    _prefs?.remove('token');
  }

  static void removedeviceId() {
    _prefs?.remove('deviceId');
  }

  static setemailSSO(String? emailSSO) {
    _prefs?.setString('emailSSO', emailSSO ?? '');
  }

  static String? get emailSSO {
    return _prefs?.getString('emailSSO');
  }

  static set credentials(Map<String, String>? creds) {
    if (creds != null) {
      final username = creds['username'] ?? '';
      final password = creds['password'] ?? '';
      final combined = '$username:$password';
      _prefs?.setString('credentials', combined);
    } else {
      _prefs?.remove('credentials');
    }
  }

  static Map<String, String>? get credentials {
    final creds = _prefs?.getString('credentials');
    if (creds != null && creds.contains(':')) {
      final parts = creds.split(':');
      if (parts.length == 2) {
        return {'username': parts[0], 'password': parts[1]};
      }
    }
    return null;
  }

  static void setService(bool isService) {
    _prefs?.setBool('isBackground', isService);
  }

  static bool get isService {
    return _prefs?.getBool('isBackground') ?? false;
  }
}
