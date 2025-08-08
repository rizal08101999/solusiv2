import 'package:get/get.dart';

class EmployeeController extends GetxController {
  final args = Get.arguments;
  final currentpage = 0.obs;

  @override
  void onInit() {
    initialiaze();
    super.onInit();
  }

  void initialiaze() {
    if (args != null) {
      currentpage.value = int.parse(args.toString());
    }
  }
}
