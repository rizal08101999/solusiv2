import 'package:get/get.dart';
import 'package:solusi/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:solusi/app/modules/home/controllers/home_controller.dart';
import 'package:solusi/app/modules/notification/controllers/notification_controller.dart';
import 'package:solusi/app/modules/profile/controllers/profile_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(NotificationController());
    Get.put(ProfileController());
  }
}
