import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/biodata_controller.dart';

class BiodataBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BiodataController());
  }
}
