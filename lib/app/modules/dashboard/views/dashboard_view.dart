// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:solusi/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:solusi/app/modules/home/views/home_view.dart';
import 'package:solusi/app/modules/menu/views/menu_view.dart';
import 'package:solusi/app/modules/notification/views/notification_view.dart';
import 'package:solusi/app/modules/profile/views/profile_views.dart';
import 'package:solusi/core/colors.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.currentNavbarIndex.value,
            children: [
              HomeView(),
              MenuView(),
              NotificationView(),
              ProfileView()
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => Container(
            height: 90.sp,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp)
              ),
              color: DataColors.bg
            ),
            child: SalomonBottomBar(
              // itemPadding: EdgeInsets.only(bottom: 10.sp, left: 20.sp, right: 20.sp, top: 6.sp),
              margin: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 25.sp),             
                currentIndex: controller.currentNavbarIndex.value,
                onTap: (index) => controller.selectIndex(index),
                items: [
                  SalomonBottomBarItem(
                    icon: Icon(Icons.dashboard_rounded, size: 28.sp, color: DataColors.white),
                    title: const Text("Home"),
                    selectedColor: DataColors.white,
                  ),
                  SalomonBottomBarItem(
                    icon: Iconify(Ph.stack_bold, size: 28.sp, color: DataColors.white),
                    activeIcon: Iconify(Ph.stack_bold, color: DataColors.white, size: 28.sp,),
                    title: const Text("Menu"),
                    selectedColor: DataColors.white,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.notifications_none, size: 28.sp, color: DataColors.white),
                    activeIcon: Icon(Icons.notifications_none, size: 28.sp, color: DataColors.white,),
                    title: const Text("Notifikasi"),
                    selectedColor: DataColors.white,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.account_circle, size: 28.sp, color: DataColors.white),
                    title: const Text("Profil"),
                    selectedColor: DataColors.white,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
