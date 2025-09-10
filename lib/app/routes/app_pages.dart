// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:solusi/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:solusi/app/modules/dashboard/views/dashboard_view.dart';
import 'package:solusi/app/modules/leave/controller/addleave_controllers.dart';
import 'package:solusi/app/modules/leave/controller/leave_controller.dart';
import 'package:solusi/app/modules/leave/view/component/addleave_views.dart';
import 'package:solusi/app/modules/leave/view/leave_views.dart';
import 'package:solusi/app/modules/login/views/login_view.dart';
import 'package:solusi/app/modules/overtime/controller/add_controllers.dart';
import 'package:solusi/app/modules/overtime/controller/overtime_controller.dart';
import 'package:solusi/app/modules/overtime/view/component/add.dart';
import 'package:solusi/app/modules/overtime/view/overtime_views.dart';
import 'package:solusi/app/modules/splash/bindings/splash_binding.dart';
import 'package:solusi/app/modules/splash/views/splash_view.dart';
import 'package:solusi/app/modules/task/controller/addtask_controllers.dart';
import 'package:solusi/app/modules/task/controller/detailtask_controllers.dart';
import 'package:solusi/app/modules/task/controller/task_controller.dart';
import 'package:solusi/app/modules/task/view/component/addtask.dart';
import 'package:solusi/app/modules/task/view/component/transfertask.dart';
import 'package:solusi/app/modules/task/view/task_views.dart';

import '../modules/absensi/controller/absensi_controller.dart';
import '../modules/absensi/view/absensi_views.dart';
import '../modules/biodata/controller/biodata_controller.dart';
import '../modules/biodata/view/biodata_views.dart';
import '../modules/employee/controller/employee_controller.dart';
import '../modules/employee/view/employee_views.dart';
import '../modules/history/controller/history_controller.dart';
import '../modules/history/view/history_views.dart';
import '../modules/kpi/controller/kpi_controller.dart';
import '../modules/kpi/view/kpi_views.dart';
import '../modules/login/controllers/login_controller.dart';
import '../modules/pkwt/controller/pkwt_controller.dart';
import '../modules/pkwt/view/pkwt_views.dart';
import '../modules/salary/controller/salary_controller.dart';
import '../modules/salary/view/salary_views.dart';
import '../modules/schedule/controller/schedule_controller.dart';
import '../modules/schedule/view/schedule_views.dart';
import '../modules/sp/controller/sp_controller.dart';
import '../modules/sp/view/sp_views.dart';
import '../modules/task/controller/transferstask_controllers.dart';
import '../modules/task/view/component/detailtask.dart';

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
      name: Path.ADDOVERTIME,
      page: () => AddViews(),
      binding: BindingsBuilder.put(() => AddControllers()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.LEAVE,
      page: () => LeaveViews(),
      binding: BindingsBuilder.put(() => LeaveController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.ADDLEAVE,
      page: () => AddLeaveViews(),
      binding: BindingsBuilder.put(() => AddleaveControllers()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.TASK,
      page: () => TaskViews(),
      binding: BindingsBuilder.put(() => TaskController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.TRANSFERTASK,
      page: () => Transfertask(),
      binding: BindingsBuilder.put(() => TransferstaskControllers()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.ADDTASK,
      page: () => AddTaskViews(),
      binding: BindingsBuilder.put(() => AddTaskController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.DETAILTASK,
      page: () => DetailtaskViews(),
      binding: BindingsBuilder.put(() => DetailtaskControllers()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.SALARY,
      page: () => SalaryViews(),
      binding: BindingsBuilder.put(() => SalaryController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: Path.KPI,
      page: () => KpiViews(),
      binding: BindingsBuilder.put(() => KpiController()),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  ];
}
