// ignore_for_file: use_key_in_widget_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/splash/controllers/splash_controller.dart';
import 'package:solusi/core/colors.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: FadeIn(
          duration: Duration(milliseconds: 550),
          child: Center(
            child: Image.asset(
              "assets/images/logo_solusi.png",
              height: 180.sp, 
              width: 180.sp
            ),
          ),
        ),
      ),
    );
  }
}
