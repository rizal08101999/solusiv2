// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/modules/profile/controllers/profile_controller.dart';
import 'package:solusi/core/colors.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 140.h,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/bg_profile.png',),fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 60,),
                  child: Column(
                    children: [
                      Text(
                        'Profil',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.sp,
                          fontFamily: 'Bold',
                        ),
                      ),
                    ],
                  ),
                )
              ),
              Positioned(
                top: 90.h,
                left: 0, 
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    width: double.infinity, 
                    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundColor: AppColors.grey5,
                          child: Obx(() => controller.profilePicture.value.isEmpty
                            ? const Icon(Icons.person, size: 50)
                            : ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: controller.profilePicture.value,
                                width: 60.w,
                                height: 60.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 2),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            )
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                              controller.username.value,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'SemiBold',
                                color: AppColors.black2
                              ),
                            )),
                            Obx(() => Text(
                              controller.company.value,//diganti perusahaan
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.black.withOpacity(0.6)
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHelpdesk(),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],);
      },)
    );
  }

  Widget buildHelpdesk() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          buildProfileItem(
            'Informasi Akun',
            IconsaxPlusBold.warning_2,
            null
          ),
          Divider(color: AppColors.grey8, height: 1.h),
          buildProfileItem(
            'Versi Aplikasi',
            IconsaxPlusBold.security_safe,
            null
          ),
          Divider(color: AppColors.grey8, height: 1.h),
          buildProfileItem(
            'Deviceid ${controller.deviceId.value}',
            IconsaxPlusBold.info_circle,
            null
          ),
          Divider(color: AppColors.grey8, height: 1.h),
          buildProfileItem(
            'Logout',
            IconsaxPlusBold.logout,
            null
          ),
        ],
      ),
    );
  }

  Widget buildProfileItem(String title, IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
        child: Row(
          spacing: 20.w,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  AppColors.gradient4,
                  AppColors.gradient3
                ], // Ganti dengan gradient kamu
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: Icon(
                icon,
                size: 28,
                color: Colors.white, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black5,
                fontFamily: 'Medium',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
