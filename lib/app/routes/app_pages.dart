// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:solusi/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:solusi/app/modules/dashboard/views/dashboard_view.dart';
import 'package:solusi/app/modules/login/bindings/login_binding.dart';
import 'package:solusi/app/modules/login/views/login_view.dart';
import 'package:solusi/app/modules/menu/bindings/absensi_binding.dart';
import 'package:solusi/app/modules/menu/bindings/biodata_binding.dart';
import 'package:solusi/app/modules/menu/bindings/jadwal_binding.dart';
import 'package:solusi/app/modules/menu/bindings/pkwt_binding.dart';
import 'package:solusi/app/modules/menu/bindings/riwayat_binding.dart';
import 'package:solusi/app/modules/menu/views/component/absensi_view.dart';
import 'package:solusi/app/modules/menu/views/component/biodata_view.dart';
import 'package:solusi/app/modules/menu/views/component/jadwal_view.dart';
import 'package:solusi/app/modules/menu/views/component/pkwt_view.dart';
import 'package:solusi/app/modules/menu/views/component/riwayat_view.dart';
import 'package:solusi/app/modules/splash/bindings/splash_binding.dart';
import 'package:solusi/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Path.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Path.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Path.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Path.BIODATA,
      page: () => BiodataView(),
      binding: BiodataBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Path.JADWAL,
      page: () => JadwalView(),
      binding: JadwalBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Path.PKWT,
      page: () => PKWTView(),
      binding: PkwtBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Path.ABSENSI,
      page: () => AbsensiView(),
      binding: AbsensiBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Path.RIWAYAT,
      page: () => RiwayatView(),
      binding: RiwayatBinding(),
      transition: Transition.downToUp
    ),
  ];
}
