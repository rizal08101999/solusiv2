// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/modules/home/controllers/home_controller.dart';
import 'package:solusi/app/modules/profile/controllers/profile_controller.dart';
import 'package:solusi/core/colors.dart';
import 'package:solusi/core/local_db.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
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
          ),
        ),
      ],
    )
  );}

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
            () {
              controller.getinfoaccount();
            },
          ),
          Divider(color: AppColors.grey8, height: 1.h),
          if (LocalDB.user != null && LocalDB.user!.arrayEmployee.length > 1)
            buildProfileItem(
              'Ganti Pegawai Aktif',
              IconsaxPlusBold.people,
              () {
                _showEmployeeSwitcher();
              },
            ),
          if (LocalDB.user != null && LocalDB.user!.arrayEmployee.length > 1)
            Divider(color: AppColors.grey8, height: 1.h),
          buildProfileItem(
            'Versi Aplikasi',
            IconsaxPlusBold.security_safe,
            null
          ),
          Divider(color: AppColors.grey8, height: 1.h),
          buildProfileItem(
            'Logout',
            IconsaxPlusBold.logout,
            () {
              controller.out();
            },
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
            if(title == "Informasi Akun" || title == "Ganti Pegawai Aktif")
            Icon(
              IconsaxPlusLinear.arrow_right_3,
              size: 20,
              color: AppColors.grey7
            )
          ],
        ),
      ),
    );
  }

  void _showEmployeeSwitcher() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih Pegawai Aktif',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'SemiBold',
                    color: AppColors.black,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: AppColors.grey11),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            if (LocalDB.user != null)
              ...LocalDB.user!.arrayEmployee.map((employee) {
                final isActive = employee.idEmployee == LocalDB.user!.activeEmployee.idEmployee;
                return InkWell(
                  onTap: isActive ? null : () {
                    final updatedUser = LocalDB.user!.switchActiveEmployee(employee.idEmployee);
                    LocalDB.saveUser(updatedUser);
                    LocalDB.user = updatedUser;
                    final c = Get.find<HomeController>();
                    c.name.value = LocalDB.user!.activeEmployee.nameEmployee;
                    controller.loadUserData();
                    Get.back();
                    Get.snackbar(
                      'Berhasil',
                      'Pegawai aktif berhasil diganti ke ${LocalDB.user!.activeEmployee.idEmployee}',
                      backgroundColor: AppColors.green2,
                      colorText: AppColors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    margin: EdgeInsets.only(bottom: 8.h),
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: isActive ? AppColors.primary : AppColors.grey10,
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: CachedNetworkImage(
                            imageUrl: employee.imageCompany,
                            width: 40.w,
                            height: 40.w,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 40.w,
                              height: 40.w,
                              color: AppColors.grey10,
                              child: Icon(Icons.business, size: 20.w, color: AppColors.grey11),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 40.w,
                              height: 40.w,
                              color: AppColors.grey10,
                              child: Icon(Icons.business, size: 20.w, color: AppColors.grey11),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                employee.nameEmployee,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'SemiBold',
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                employee.numberEmployee,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.grey11,
                                ),
                              ),
                              Text(
                                employee.nameCompany,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.grey2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isActive)
                          Icon(
                            Icons.check_circle,
                            color: AppColors.green2,
                            size: 20.w,
                          ),
                      ],
                    ),
                  ),
                );
              }),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
