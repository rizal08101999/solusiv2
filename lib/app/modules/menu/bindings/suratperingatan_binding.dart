import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/suratperingatan_controller.dart';

class SuratPeringatanBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(SuratPeringatanController());
  }
  
}