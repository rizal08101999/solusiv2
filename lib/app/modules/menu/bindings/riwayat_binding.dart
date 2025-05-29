import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/riwayat_controller.dart';

class RiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RiwayatController());
  }
  
}