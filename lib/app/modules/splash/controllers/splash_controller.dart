import 'package:get/get.dart';
import 'package:solusi/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(Routes.LOGIN);
    });
    super.onInit();
  }
}