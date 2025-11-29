import 'package:get/get.dart';
import 'package:solusi/app/modules/schedule/model/schedule_model.dart';
import 'package:solusi/app/repositorys/scheduleabsence_repository.dart';
import '../../../widgets/pop_up_load.dart';

class ScheduleController extends GetxController {
  final scheduleData = <ScheduleEntity>[].obs;
  final scheduleRepo = ScheduleAbsenceRepository();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      getScheduleData();
    });
  }

  Future<void> getScheduleData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await scheduleRepo.getScheduleData();
      scheduleData.assignAll(data);
    } catch (e) {
      scheduleData.clear();
    } finally {
      Get.back();
    }
  }
}
