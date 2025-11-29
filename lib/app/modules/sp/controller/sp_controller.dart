import 'package:get/get.dart';
import 'package:solusi/app/modules/sp/model/sp_model.dart';
import 'package:solusi/app/repositorys/staffing_repository.dart';
import '../../../widgets/pop_up_load.dart';

class SpController extends GetxController {
  final spData = <SpEntity>[].obs;
  final staffingRepo = StaffingRepository();

  Future<void> getSpData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getSp();
      spData.assignAll(data);
      print(spData.length);
    } catch (e) {
      print(e);
      spData.clear();
    } finally {
      Get.back();
    }
  }
}
