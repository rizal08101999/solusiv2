import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/jadwal_controller.dart';

class JadwalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(JadwalController());
  }
  
}