// ignore_for_file: use_key_in_widget_constructors, unrelated_type_equality_checks, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:solusi/app/modules/menu/controllers/riwayat_controller.dart';
import 'package:solusi/core/colors.dart';

class RiwayatView extends StatefulWidget {
  @override
  State<RiwayatView> createState() => _RiwayatViewState();
}

class _RiwayatViewState extends State<RiwayatView> {
  final controller = Get.find<RiwayatController>();
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
                    onTap: () {
                      Get.back();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.angleLeft,
                      size: 25.sp,
                      color: DataColors.white,
                    ),
                  ),
                  Text(
                    "Riwayat Absensi",
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
              color: DataColors.bgriwayat),
          child: Column(
            children: [
              Container(
                height: 70.sp,
                width: double.infinity,
                padding: EdgeInsets.all(0.sp),
                child: ListView.builder(
                  controller: controller.controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: DateTime(controller.currentDate.year,
                          controller.currentDate.month + 1, 0)
                      .day,
                  itemBuilder: (context, index) {
                    final DateTime date = DateTime(controller.currentDate.year,
                        controller.currentDate.month, index + 1);
                    return AutoScrollTag(
                      key: ValueKey(index),
                      controller: controller.controller,
                      index: index,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.isSelectedList = List.generate(
                              controller.isSelectedList.length,
                              (i) => i == index,
                            );
                            controller.initialIndex = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.sp),
                          child: Container(
                            height: 50.sp,
                            width: 70.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: index == controller.initialIndex
                                    ? DataColors.bg
                                    : DataColors.bgriwayat,
                                border: index == controller.initialIndex
                                    ? Border.all(color: DataColors.white)
                                    : Border.all(color: DataColors.bg)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.sp),
                                child: Column(
                                  children: [
                                    Text(
                                      date.day.toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: index == controller.initialIndex
                                            ? DataColors.white
                                            : DataColors.bg,
                                      ),
                                    ),
                                    Text(
                                      controller.getDayOfWeek(date.weekday),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: index == controller.initialIndex
                                            ? DataColors.white
                                            : DataColors.bg,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              controller.initialIndex != 0
                  ? Padding(
                      padding: EdgeInsets.only(top: 220.sp),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/datatidakada.png",
                            height: 120.sp,
                            width: 120.sp,
                            color: DataColors.bg,
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
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80.sp,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: DataColors.white,
                              border: Border.all(
                                  color: DataColors.black.withOpacity(0.3),
                                  strokeAlign: 0.2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ]),
                          child: Row(
                            children: [
                              Container(
                                height: 70.sp,
                                width: 1.sp,
                                color: DataColors.teal700,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15.sp),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.sp),
                                  child: Icon(
                                    Icons.login_rounded,
                                    size: 24.sp,
                                    color: DataColors.bg,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 18.sp, left: 8.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Absen Masuk",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.black),
                                        ),
                                        Text(
                                          "01-02-2024",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 158.sp),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "11:22:04",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.black),
                                        ),
                                        Text(
                                          "Terlambat",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red[600]),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 13.sp,
                        ),
                        Container(
                          height: 80.sp,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              color: DataColors.white,
                              border: Border.all(
                                  color: DataColors.black.withOpacity(0.3),
                                  strokeAlign: 0.2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ]),
                          child: Row(
                            children: [
                              Container(
                                height: 70.sp,
                                width: 1.sp,
                                color: DataColors.red700,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 15.sp),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.sp),
                                  child: Icon(
                                    Icons.logout_rounded,
                                    size: 24.sp,
                                    color: DataColors.bg,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 18.sp, left: 8.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Absen Pulang",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                              color: DataColors.black),
                                        ),
                                        Text(
                                          "01-02-2024",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: DataColors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 125.sp),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "14:22:04",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: DataColors.black),
                                        ),
                                        Text(
                                          "Pulang Duluan",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red[600]),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
