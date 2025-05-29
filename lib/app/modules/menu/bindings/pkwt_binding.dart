import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/pkwt_controller.dart';

class PkwtBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PkwtController());
  }
  
}