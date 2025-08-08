import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:solusi/app/routes/app_pages.dart';

import '../../../../core/local_db.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalDB.init();
    await initializeDateFormatting('id_ID', null);
    await precacheImage(const AssetImage('assets/images/bg_home.jpg'), Get.context!);
    if (LocalDB.user != null) {
      Future.delayed(const Duration(milliseconds: 1750)).then((value) => Get.offAllNamed(Routes.DASHBOARD),);
    } else {
      Future.delayed(const Duration(milliseconds: 1750)).then((value) => Get.offAllNamed(Routes.LOGIN),);
    }
    super.onInit();
  }
}