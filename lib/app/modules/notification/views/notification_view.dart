// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/notification/controllers/notification_controller.dart';
import 'package:solusi/core/colors.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: DataColors.bg,
          body: Padding(
            padding: EdgeInsets.only(top: 15.sp),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Notifikasi",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: DataColors.white),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height / 1.3.sp,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.sp),
                  topRight: Radius.circular(30.sp),
                ),
                color: DataColors.white),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 300.sp),
                  child: Image.asset(
                    "assets/images/datatidakada.png",
                    height: 120.sp,
                    width: 120.sp,
                    color: DataColors.bg,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.sp),
                  child: Text(
                    "Tidak ada data",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: DataColors.grey),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
