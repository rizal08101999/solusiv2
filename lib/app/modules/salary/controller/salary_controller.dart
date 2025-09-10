import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SalaryController extends GetxController {
  final isnotemptydate = false.obs;
  final isshowrequireddate = false.obs;
  final date = "".obs;
  var selectedDatee = Rx<DateTime>(DateTime.now());

  @override
  void onInit() {
    initialiaze();
    super.onInit();
  }

  void initialiaze() {
    date.value = DateFormat('yyyy').format(selectedDatee.value);
    selectedDatee.value = DateTime.now();
  }
}
