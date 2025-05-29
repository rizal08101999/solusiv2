// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/login/controllers/login_controller.dart';
import 'package:solusi/app/routes/app_pages.dart';
import 'package:solusi/core/colors.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: 20.sp, right: 20.sp, bottom: 20.sp, top: 50.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: Center(
                  child: Image.asset(
                    "assets/images/vector_login.png",
                    height: 350.sp,
                    width: 350.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.sp),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: 'Poppins-ExtraBold',
                      color: DataColors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.sp),
                child: Text(
                  "Silahkan login dan gunakan akses anda dengan baik",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: DataColors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp),
                child: TextFormField(
                  autocorrect: false,
                  controller: controller.usernameC,
                  cursorColor: DataColors.grey900,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: DataColors.black),
                  decoration: InputDecoration(
                    label: Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: DataColors.black),
                    ),
                    labelStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: DataColors.black),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(color: DataColors.grey100)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(color: DataColors.black.withOpacity(0.8))),
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(top: 15.sp),
                  child: TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    cursorColor: DataColors.grey900,
                    controller: controller.passwordC,
                    obscureText: controller.isVisible.value,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: DataColors.black),
                    decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: DataColors.black),
                      ),
                      suffixIcon: InkWell(
                        borderRadius: BorderRadius.circular(40.sp),
                        onTap: () {
                          if (controller.isVisible.isTrue) {
                            controller.isVisible.value = false;
                          } else {
                            controller.isVisible.value = true;
                          }
                        },
                        child: Obx(() => controller.isVisible.isTrue
                            ? Padding(
                                padding: EdgeInsets.only(right: 10.sp),
                                child: Icon(
                                  Icons.remove_red_eye_rounded,
                                  size: 18.sp,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(right: 10.sp),
                                child: Icon(
                                  Icons.visibility_off_rounded,
                                  size: 18.sp,
                                ),
                              )),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(color: DataColors.grey100)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: BorderSide(
                              color: DataColors.black.withOpacity(0.8))),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DASHBOARD);
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 30.sp),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 15.sp, right: 25.sp, bottom: 10.sp, top: 10.sp),
                    height: 60.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: DataColors.greybutton),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 22.sp,
                          color: DataColors.white,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: DataColors.white),
                        ),
                        const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
