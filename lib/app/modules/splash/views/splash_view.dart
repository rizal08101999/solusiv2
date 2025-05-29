// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/splash/controllers/splash_controller.dart';
import 'package:solusi/core/colors.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DataColors.white,
      body: Center(
        child: Image.asset("assets/images/logo_solusi.png",
            height: 180.sp, width: 180.sp),
      ),
    );
  }
}
