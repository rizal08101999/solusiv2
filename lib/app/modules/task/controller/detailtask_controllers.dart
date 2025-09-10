import 'package:get/get.dart';
import 'package:solusi/app/modules/task/model/task_model.dart';

class DetailtaskControllers extends GetxController {
  final args = Get.arguments;
  final datadetail = Rxn<TaskModel>();

  @override
  void onInit() {
    initialiaze();
    super.onInit();
  }

  void initialiaze() {
    datadetail.value = args;
  }
  
  String status() {
    if (datadetail.value!.status.name == TaskStatus.dibatalkan.name) {
      return "Dibatalkan";
    } else if (datadetail.value!.status.name == TaskStatus.belumDiambil.name) {
      return "Belum Diambil";
    } else if (datadetail.value!.status.name == TaskStatus.onProgress.name) {
      return "On Progress";
    } else {
      return "Selesai";
    }
  }

}

