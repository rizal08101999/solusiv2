// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:solusi/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:solusi/app/modules/dashboard/views/dashboard_view.dart';
import 'package:solusi/app/modules/login/views/login_view.dart';
import 'package:solusi/app/modules/overtime/controller/overtime_controller.dart';
import 'package:solusi/app/modules/overtime/view/overtime_views.dart';
import 'package:solusi/app/modules/splash/bindings/splash_binding.dart';
import 'package:solusi/app/modules/splash/views/splash_view.dart';

import '../modules/absensi/controller/absensi_controller.dart';
import '../modules/absensi/view/absensi_views.dart';
import '../modules/biodata/controller/biodata_controller.dart';
import '../modules/biodata/view/biodata_views.dart';
import '../modules/employee/controller/employee_controller.dart';
import '../modules/employee/view/employee_views.dart';
import '../modules/history/controller/history_controller.dart';
import '../modules/history/view/history_views.dart';
import '../modules/login/controllers/login_controller.dart';
import '../modules/pkwt/controller/pkwt_controller.dart';
import '../modules/pkwt/view/pkwt_views.dart';
import '../modules/schedule/controller/schedule_controller.dart';
import '../modules/schedule/view/schedule_views.dart';
import '../modules/sp/controller/sp_controller.dart';
import '../modules/sp/view/sp_views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Path.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Path.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder.put(() => LoginController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.BIODATA,
      page: () => BiodataViews(),
      binding: BindingsBuilder.put(() => BiodataController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.EMPLOYEE,
      page: () => EmployeeViews(),
      binding: BindingsBuilder(() {
        Get.put(EmployeeController());
        Get.put(BiodataController());
        Get.put(SpController());
        Get.put(PkwtController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.JADWAL,
      page: () => ScheduleViews(),
      binding: BindingsBuilder.put(() => ScheduleController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.PKWT,
      page: () => PkwtViews(),
      binding: BindingsBuilder.put(() => PkwtController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.ABSENSI,
      page: () => AbsensiViews(),
      binding: BindingsBuilder.put(() => AbsensiController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.RIWAYAT,
      page: () => HistoryViews(),
      binding: BindingsBuilder.put(() => HistoryController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.SURAT_PERINGATAN,
      page: () => SpViews(),
      binding: BindingsBuilder.put(() => SpController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.OVERTIME,
      page: () => OvertimeViews(),
      binding: BindingsBuilder.put(() => OvertimeController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.LEAVE,
      page: () => OvertimeViews(),
      binding: BindingsBuilder.put(() => OvertimeController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  ];
}
