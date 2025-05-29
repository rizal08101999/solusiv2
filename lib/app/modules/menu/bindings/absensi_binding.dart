import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/absensi_controller.dart';

class AbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AbsensiController());
  }
  
}