// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:solusi/app/routes/app_pages.dart';
import 'package:solusi/app/widgets/pop_up_load.dart';
import 'package:solusi/core/local_db.dart';
import 'package:solusi/app/repositorys/auth_repositorys.dart';
import 'package:solusi/app/modules/profile/models/profile_models.dart';

import '../../../../core/helper.dart';
import '../../../widgets/confirmationlogout.dart';

class ProfileController extends GetxController {
  final authRepo = AuthRepositorys();
  final profileData = Rxn<ProfileModels>();
  final loading = false.obs;
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
    loadUserData();
    // await fetchProfileData();
    deviceId.value = LocalDB.getDeviceId() ?? "belum ada device id";
  }

  void getinfoaccount() async {
    Get.toNamed(Routes.INFOACCOUNT);
    await fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      loading.value = true;
      final profile = await authRepo.getProfileData();
      if (profile != null) {
        profileData.value = profile;
        username.value = profile.name;
        company.value = profile.email;
      }
    } catch (e) {
      print('Error fetching profile: $e');
    } finally {
      loading.value = false;
    }
  }

  void loadUserData() {
    if (LocalDB.user != null) {
      username.value = LocalDB.user!.activeEmployee.nameEmployee;
      company.value = LocalDB.user!.activeEmployee.nameCompany;
    }
  }

  void out() {
    Get.dialog(
      barrierDismissible: false,
      ConfirmationLogout(
        onPressedaccept: () async {
          Get.back();
          Get.dialog(PopUpLoad());
          await Future.delayed(Duration(milliseconds: 500));
          Get.back();
          Get.offAllNamed(Routes.LOGIN);
        LocalDB.user = null;
          LocalDB.removedeviceId();
          LocalDB.removeToken();
        },
        onPresseddenied: () {
          Get.back();
        },
        subtitle: "Anda akan melakukan login ulang untuk mengakses akun ini kembali",
        textbuttonaccept: "Keluar",
        title: "Yakin anda keluar?",
      )
    );
  }

}