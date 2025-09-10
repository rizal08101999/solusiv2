// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import '../../../../core/colors.dart';
import '../../../../core/helper.dart';
import '../controller/absensi_controller.dart';

class AbsensiViews extends GetView<AbsensiController> {
  const AbsensiViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    child: Icon(
                      IconsaxPlusLinear.arrow_left_1,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                  Text(
                    "Data Absensi Pegawai",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'SemiBold',
                        color: AppColors.white),
                  ),
                  SizedBox.shrink()
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
                padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10),
                child: SingleChildScrollView(child: buildabsence())
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget buildnodata() {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 115),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/nodataabsen.png'
          ),
          Column(
            children: [
              Text(
                "Anda belum melakukan absensi nih..",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: 'SemiBold',
                  color: AppColors.black
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "Klik tombol di bawah ya untuk melakukan absensi masuk hari ini.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.grey15
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientnavbar2,
                  AppColors.gradientnavbar,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.4,
                  color: AppColors.black.withOpacity(0.25),  
                  offset: Offset(0, 4)
                )
              ],
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              "Lakukan Absensi",
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Medium',
                color: AppColors.white
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget buildabsence() {
    final date = DateFormat('EEEE, d MMMM y', 'id').format(DateTime.now());
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 22.5,
                    color: AppColors.black.withOpacity(0.09),  
                    offset: Offset(0, 1)
                  )
                ],
                color: AppColors.white,
              ),
              child: Column(
                spacing: 15, 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Absensi",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nama",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Medium',
                          color: AppColors.grey11                    
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey10),
                          color: AppColors.bg2
                        ),
                        child: Text(
                          "A. Badawi",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.black
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tanggal Absensi",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Medium',
                          color: AppColors.grey11                    
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey10),
                          color: AppColors.bg2
                        ),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.black
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jenis Absensi",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Medium',
                          color: AppColors.grey11                    
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey10),
                          color: AppColors.bg2
                        ),
                        child: Text(
                          "Absen Masuk",
                          style: TextStyle(
                            fontSize: 14.sp,  
                            color: AppColors.black
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 22.5,
                    color: AppColors.black.withOpacity(0.09),  
                    offset: Offset(0, 1)
                  )
                ],
                color: AppColors.white,
              ),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lokasi anda",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'SemiBold',
                          color: AppColors.black
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.refreshlocation();
                        },
                        overlayColor: WidgetStatePropertyAll(Colors.transparent),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                            colors: [
                                AppColors.gradientnavbar2,
                                AppColors.gradientnavbar,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.4,
                                color: AppColors.black.withOpacity(0.25),  
                                offset: Offset(0, 4)
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Refresh Lokasi",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: 'SemiBold',
                              color: AppColors.white
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Koordinat",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Medium',
                            color: AppColors.grey11                    
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.grey10),
                            color: AppColors.bg2
                          ),
                          child: Text(
                            controller.positionnow.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Medium',
                              color: AppColors.black
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Keterangan",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Medium',
                          color: AppColors.grey11                    
                        ),
                      ),
                      SizedBox(width: 35,),
                      Flexible( // atau bisa pakai Expanded
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.grey10),
                            color: AppColors.bg2,
                          ),
                          child: Text(
                            controller.locationnow.value,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Medium',
                              color: AppColors.black,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Lokasi Area Absensi",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Koordinat",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Medium',
                          color: AppColors.grey11                    
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey10),
                          color: AppColors.bg2
                        ),
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Medium',
                            color: AppColors.black
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Keterangan",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Medium',
                          color: AppColors.grey11                    
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.grey10),
                          color: AppColors.bg2
                        ),
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Medium',
                            color: AppColors.black
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  authenticate();
                },
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 15.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientnavbar2,
                        AppColors.gradientnavbar,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.4,
                        color: AppColors.black.withOpacity(0.25),  
                        offset: Offset(0, 4)
                      )
                    ],
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Center(
                    child: Text(
                      "Lakukan Absensi",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'SemiBold',
                        color: AppColors.white
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },);
  }

}
