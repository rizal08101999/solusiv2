import 'package:get/get.dart';
import 'package:solusi/app/repositorys/staffing_repository.dart';
import '../../../widgets/pop_up_load.dart';
import '../model/pkwt_model.dart';

class PkwtController extends GetxController {
  final pkwtData = <PkwtModel>[].obs;
  final staffingRepo = StaffingRepository();


  Future<void> getPkwtData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getPkwt();
      pkwtData.assignAll(data);
    } catch (e) {
      pkwtData.clear();
    } finally {
      Get.back();
    }
  }

  dynamic getPkwtDataByTitle(String title) {
    final item = pkwtData.firstWhere(
      (element) => element.title.toLowerCase() == title.toLowerCase(),
      orElse: () => PkwtModel(title: '', data: ''),
    );
    if (item.data == null || item.data == '') return '';
    return item.data;
  }
}
