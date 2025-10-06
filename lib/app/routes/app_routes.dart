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
  static const SURAT_PERINGATAN = Path.SURAT_PERINGATAN;
  static const HISTORY = Path.HISTORY;
  static const MENUS = Path.MENUS;
  static const SCHEDULE = Path.SCHEDULE;
  static const LEAVE = Path.LEAVE;
  static const OVERTIME = Path.OVERTIME;
  static const EMPLOYEE = Path.EMPLOYEE;
  static const ADDOVERTIME = Path.ADDOVERTIME;
  static const ADDLEAVE = Path.ADDLEAVE;
  static const ADDTASK = Path.ADDTASK;
  static const TASK = Path.TASK;
  static const SALARY = Path.SALARY;
  static const KPI = Path.KPI;
  static const DETAILTASK = Path.DETAILTASK;
  static const TRANSFERTASK = Path.TRANSFERTASK;
  static const INFOACCOUNT = Path.INFOACCOUNT;
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
  static const SURAT_PERINGATAN = '/surat-peringatan';
  static const HISTORY = '/history';
  static const MENUS = '/menus';
  static const SCHEDULE = '/schedule';
  static const LEAVE = '/leave';
  static const OVERTIME = '/overtime';
  static const EMPLOYEE = '/employee';
  static const TASK = '/task';
  static const SALARY = '/salary';
  static const KPI = '/kpi';
  static const ADDOVERTIME = '/add-overtime';
  static const ADDLEAVE = '/add-leave';
  static const ADDTASK = '/add-task';
  static const DETAILTASK = '/detail-task';
  static const TRANSFERTASK = '/transfer-task';
  static const INFOACCOUNT = '/info-account';
}
