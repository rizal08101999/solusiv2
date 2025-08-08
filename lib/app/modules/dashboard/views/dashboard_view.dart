// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:solusi/app/modules/home/views/home_view.dart';
import 'package:solusi/app/modules/profile/views/profile_views.dart';
import 'package:solusi/core/colors.dart';

const tabBarItem = {
  "Beranda": IconsaxPlusLinear.home_1,
  "Menu": IconsaxPlusBold.category,
  "Profil": IconsaxPlusLinear.user,
};

const tabBarItembold = {
  "Beranda": IconsaxPlusBold.home_1,
  "Menu": IconsaxPlusBold.category,
  "Profil": IconsaxPlusBold.user,
};

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.currentNavbarIndex.value,
          children: [
            HomeView(),
            SizedBox.shrink(),
            ProfileView()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 30.sp, bottom: 10.sp, left: 20.sp, right: 20.sp),
        child: Row(
          spacing: 85,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            tabBarItem.length,
            (index) => buildbottomnavbar(index),
          ),
        ),
      ),

    );
  }

  Widget buildbottomnavbar(int index) {
    return Obx(() {
      Widget iconWidget;

      if (index == 1) {
        // Icon bulat dengan gradient untuk index ke-2
        iconWidget = Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.gradient3,
                AppColors.gradient4,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Icon(
            controller.currentNavbarIndex.value == index
                ? tabBarItembold.values.elementAt(index)
                : tabBarItem.values.elementAt(index),
            size: 24,
            color: AppColors.white,
          ),
        );
      } else {
        // Icon biasa untuk index lainnya
        iconWidget = Icon(
          controller.currentNavbarIndex.value == index
              ? tabBarItembold.values.elementAt(index)
              : tabBarItem.values.elementAt(index),
          size: 28,
          color: controller.currentNavbarIndex.value == index
              ? AppColors.black4
              : AppColors.grey2,
        );
      }

      // Konten utama untuk setiap item navbar
      Widget content = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          const SizedBox(height: 5),
          Text(
            tabBarItem.keys.elementAt(index),
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: controller.currentNavbarIndex.value == index
                  ? 'SemiBold'
                  : 'DMSans',
              color: controller.currentNavbarIndex.value == index
                  ? AppColors.black4
                  : AppColors.grey2,
            ),
          ),
        ],
      );

      return InkWell(
        onTap: () {
          controller.selectIndex(index);
        },
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Transform.translate(
          offset: index == 1 ? const Offset(0, -10) : Offset.zero,
          child: content,
        ),
      );
    });
  }

}
