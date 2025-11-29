import 'package:get/get.dart';
import 'package:solusi/app/repositorys/auth_repositorys.dart';
import 'package:solusi/app/modules/profile/models/profile_models.dart';

class InfoaccountController extends GetxController {
  final authRepo = AuthRepositorys();
  final profileData = Rxn<ProfileModels>();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      loading.value = true;
      final profile = await authRepo.getProfileData();
      if (profile != null) {
        profileData.value = profile;
      }
    } catch (e) {
      print('Error fetching profile: $e');
    } finally {
      loading.value = false;
    }
  }
}
