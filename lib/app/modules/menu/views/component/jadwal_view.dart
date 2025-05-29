// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/jadwal_controller.dart';
import 'package:solusi/core/colors.dart';

class JadwalView extends GetView<JadwalController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: DataColors.bg,
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.only(top: 15.sp, left: 15.sp, right: 15.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: FaIcon(
                        FontAwesomeIcons.angleLeft,
                        size: 25.sp,
                        color: DataColors.white,
                      ),
                    ),
                    Text(
                      "Jadwal Pegawai",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: DataColors.white),
                    ),
                    const SizedBox.shrink()
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 20.sp, left: 15.sp, right: 15.sp),
            height: MediaQuery.of(context).size.height <= 750
              ? MediaQuery.of(context).size.height / 1.35.sp
              : MediaQuery.of(context).size.height <= 770
                  ? MediaQuery.of(context).size.height / 1.25.sp
                  : MediaQuery.of(context).size.height / 1.165.sp,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.sp),
                  topRight: Radius.circular(30.sp),
                ),
                color: DataColors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Senin",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 45.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.grey100),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jam Normal (WGP) (09:21:00 - 17:00:00)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: DataColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Selasa",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 45.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.grey100),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jam Normal (WGP) (09:21:00 - 17:00:00)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: DataColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Rabu",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 45.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.grey100),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jam Normal (WGP) (09:21:00 - 17:00:00)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: DataColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Kamis",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 45.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.grey100),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jam Normal (WGP) (09:21:00 - 17:00:00)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: DataColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Jum'at",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 45.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.grey100),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jam Normal (WGP) (09:21:00 - 17:00:00)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: DataColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Sabtu",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 45.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.grey100),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jam Normal (WGP) (09:21:00 - 17:00:00)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: DataColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  "Minggu",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                  ),
                ),
                SizedBox(
                  height: 8.sp,
                ),
                Container(
                  height: 45.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: DataColors.grey100),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jam Normal (WGP) (09:21:00 - 17:00:00)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: DataColors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
              ],
            ),
          )),
    );
  }
}
