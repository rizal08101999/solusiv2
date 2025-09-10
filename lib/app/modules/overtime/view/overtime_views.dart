// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/routes/app_pages.dart';
import '../../../../core/colors.dart';
import '../controller/overtime_controller.dart';

class OvertimeViews extends GetView<OvertimeController> {
  const OvertimeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 5),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.ADDOVERTIME),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientnavbar2,
                  AppColors.gradientnavbar,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ), 
            ),
            child: Icon(
              IconsaxPlusLinear.add,
              size: 38.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_absensi.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Get.back(),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      child: Icon(
                        IconsaxPlusLinear.arrow_left_1,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  Text(
                    "Data Lembur Pegawai",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.bg2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.sp),
                    topRight: Radius.circular(25.sp),
                  ),
                ),
                padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
                child: ListView.builder(itemBuilder: (context, index) => builditemovertime(), itemCount: 3,)
              )
            ),
          ],
        ),
      ),
    );
  }
  
  Widget builditemovertime() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 17.5,
              color: AppColors.black.withOpacity(0.08),  
              offset: Offset(0, 0)
            )
          ]
        ),
        child: Stack(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.gradientnavbar2,
                          AppColors.gradientnavbar,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Lembur Shift Tambahan",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'SemiBold',
                                  color: AppColors.black,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(999),
                                  color: ColorsSchedule.red,
                                ),
                                child: Text(
                                  "Dibatalkan",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              buildrowitem(title: "Tanggal", value: "19 Juni 2025"),
                              buildrowitem(title: "Waktu Masuk", value: "08:42:00"),
                              buildrowitem(title: "Waktu Pulang", value: "22:42:00"),
                              buildrowitem(title: "Catatan", value: "Catatan lembur"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 45,
              left: 0,
              right: 0,
              child: Divider(
                thickness: 1,
                color: AppColors.grey20,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget buildrowitem({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.grey19
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'Medium',
            color: AppColors.black
          ),
        ),
      ],
    );
  }
}
