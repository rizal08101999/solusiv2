import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solusi/app/repositorys/auth_repositorys.dart';
import 'dart:io' show Platform;

import '../../../../core/helper.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final isVisible = true.obs;
  final loading = false.obs;
  final authrepo = AuthRepositorys();

  @override
  void onInit() {
    super.onInit();
    // Request permissions when app starts
    requestIOSPermissions();
  }

  void requestIOSPermissions() async {
    if (Platform.isIOS) {
      // Request all necessary iOS permissions
      await requestAllIOSPermissions();
    }
  }

  void login() async {
    loading.value = true;
    await authrepo.doLogin(username: usernameC.text, password: passwordC.text).then((value) {
      if (value == true) {
        debugPrint("gagal");
        loading.value = false;
      } else {
        loading.value = false;
        Future.delayed(const Duration(milliseconds: 200)).then((value) => Get.offAllNamed(Routes.DASHBOARD));
      }
    },);
  }
}