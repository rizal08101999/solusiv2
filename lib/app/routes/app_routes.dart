// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = Path.SPLASH;
  static const LOGIN = Path.LOGIN;
  static const DASHBOARD = Path.DASHBOARD;
  static const BIODATA = Path.BIODATA;
  static const JADWAL = Path.JADWAL;
  static const PKWT = Path.PKWT;
  static const ABSENSI = Path.ABSENSI;
  static const RIWAYAT = Path.RIWAYAT;
}

abstract class Path {
  Path._();
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
  static const BIODATA = '/biodata';
  static const PKWT = '/pwkt';
  static const JADWAL = '/jadwal';
  static const ABSENSI = '/absensi';
  static const RIWAYAT = '/riwayat';
}