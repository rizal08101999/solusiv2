// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/widgets/loadingdata.dart';
import 'package:solusi/core/colors.dart';

import '../../controllers/profile_controller.dart';

class Infoaccount extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Header
          Container(
            width: double.infinity,
            height: 180.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_profile.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    child: Icon(
                      IconsaxPlusLinear.arrow_left_1,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Informasi Akun',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Bold',
                    ),
                  ),
                  SizedBox.shrink()
                ],
              ),
            ),
          ),

          // Card isi
          Positioned(
            top: 110.h, // hanya set top, jangan bottom
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: MediaQuery.of(context).size.height - 100.h, // biar tetap panjang layar
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Obx(() {
                  if (controller.loading.isTrue) {
                    return Column(
                      spacing: 10,
                      children: List.generate(5, (index) => BuildLoading(height: 50,),),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          builditemaccount(title: "Nama", subtitle: controller.profileData.value?.name ?? ""),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(color: AppColors.grey8),
                          ),
                          builditemaccount(title: "Email", subtitle: controller.profileData.value?.email ?? ""),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(color: AppColors.grey8),
                          ),
                          builditemaccount(title: "Username", subtitle: controller.username.value),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(color: AppColors.grey8),
                          ),
                          builditemaccount(title: "No telepon", subtitle: controller.profileData.value?.phoneNumber ?? ""),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(color: AppColors.grey8),
                          ),
                          builditemaccount(
                            title: "Alamat",
                            subtitle:
                                controller.profileData.value?.address ?? "",
                          ),
                        ],
                      ),
                    );
                  }
                },)
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget builditemaccount({
    required String title,
    required String subtitle,
  }) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: 'Medium',
            color: AppColors.grey7
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: 'SemiBold',
            color: AppColors.black
          ),
        )
      ],
    );
  }
}
