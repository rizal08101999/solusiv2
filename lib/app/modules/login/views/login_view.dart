// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/modules/login/controllers/login_controller.dart';
import 'package:solusi/core/colors.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg_login.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Image.asset(
                              'assets/images/vector_login.png',
                              width: 350,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selamat Datang",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.grey3,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontFamily: 'DMSans',
                                    color: AppColors.black2,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:"Masuk dan mulai pekerjaanmu\nhari ini dengan ",
                                      style: TextStyle(fontFamily: 'SemiBold'),
                                    ),
                                    TextSpan(
                                      text: "SOLUSI.",
                                      style: TextStyle(
                                        fontFamily: 'Bold',
                                        color: AppColors.primary2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 11.9,
                                  offset: Offset(0, 4),
                                  color: Colors.black.withOpacity(0.08),
                                  spreadRadius: 0,
                                ),
                              ],
                              color: AppColors.grey4,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                              child: Column(
                                spacing: 15,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Username
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
                                    child: Column(
                                      spacing: 5,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Username",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: 'SemiBold',
                                            color: AppColors.black3,
                                          ),
                                        ),
                                        TextFormField(
                                          autocorrect: false,
                                          controller: controller.usernameC,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.black3,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Masukkan Username",
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.grey5,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: AppColors.grey5,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: AppColors.grey5,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              IconsaxPlusLinear.profile,
                                              color: AppColors.grey5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Password
                                  Obx(() => Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Column(
                                      spacing: 5,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Password",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: 'SemiBold',
                                            color: AppColors.black3,
                                          ),
                                        ),
                                        TextFormField(
                                          autocorrect: false,
                                          controller: controller.passwordC,
                                          obscureText: controller.isVisible.value,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.black3,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Masukkan Password",
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.grey5,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: AppColors.grey5,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: AppColors.grey5,
                                              ),
                                            ),
                                            prefixIcon: Icon(
                                              IconsaxPlusLinear.lock_1,
                                              color: AppColors.grey5,
                                            ),
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                controller.isVisible.toggle();
                                              },
                                              overlayColor: WidgetStateProperty.all(Colors.transparent),
                                              child: Icon(
                                                controller.isVisible.isTrue ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
                                                size: 20,
                                                color: AppColors.grey5,
                                              ),
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),),
                                  Obx(() => Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          controller.login();
                                        },
                                        overlayColor: WidgetStatePropertyAll(Colors.transparent),
                                        child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        width: controller.loading.isTrue ? 68 : MediaQuery.of(context).size.width,
                                        padding: controller.loading.isTrue ? EdgeInsets.all(15) : EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(999),
                                          gradient: LinearGradient( 
                                            colors: [
                                              AppColors.gradient7,
                                              AppColors.gradient8,
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          )
                                        ),
                                        child: controller.loading.isTrue
                                            ? Center(
                                                child: SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 4,
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(bottom: 10),
                                                child: Center(
                                                  child: Text(
                                                    "Login",
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontFamily: 'SemiBold',
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      )
                                      ),
                                    ),
                                  ),)
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
