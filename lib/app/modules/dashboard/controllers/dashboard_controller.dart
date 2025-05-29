import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentNavbarIndex = 0.obs;
  final argNavbarIndex = 0.obs;
  

  void selectIndex(int index) {
    currentNavbarIndex.value = index;
  }
}