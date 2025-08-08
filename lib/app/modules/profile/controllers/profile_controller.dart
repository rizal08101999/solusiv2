import 'package:get/get.dart';
import 'package:solusi/core/local_db.dart';

import '../../../../core/helper.dart';

class ProfileController extends GetxController {
  final username = "A.Badawi".obs;
  final company = "badawi93@gmail.com".obs;
  final deviceId = "".obs;
  final profilePicture = "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D".obs;

  @override
  void onInit() {
    initialiaze();
    super.onInit();
  }

  void initialiaze() async {
    await getDeviceId().then((value) => LocalDB.setDeviceId(value!),);
    username.value = LocalDB.user!.arrayActiveEmployee.nameEmployee;
    company.value = LocalDB.user!.arrayActiveEmployee.nameCompany;
    deviceId.value = LocalDB.getDeviceId() ?? "belum ada device id";
  }

}