// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solusi/app/modules/absensi/model/absensi_model.dart';
import '../../../../core/colors.dart';
import '../../../widgets/loadingdata.dart';
import '../controller/absensi_controller.dart';



class AbsensiViews extends GetView<AbsensiController> {
  const AbsensiViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                      onTap: () {
                        if (controller.showformabsence.isTrue) {
                          controller.disableformabsence();
                        } else {
                          Get.back();
                        }
                      },
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      child: Icon(
                        IconsaxPlusLinear.arrow_left_1,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                    Text(
                      controller.showformabsence.isTrue ? "Absensi Pegawai" : "Data Absensi Pegawai",
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
              if (controller.showformabsence.value)
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
                )
              else
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.gradient,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.sp),
                        topRight: Radius.circular(25.sp),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: controller.loading.isTrue ?
                            SingleChildScrollView(
                              child: Column(
                                spacing: 10,
                                children: List.generate(10, (index) => BuildLoading(height: 100,),),
                              ),
                            ) :
                            controller.listabsence.isNotEmpty ?
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  children: List.generate(controller.listabsence.length, (index) => 
                                    TweenAnimationBuilder<double>(
                                      duration: Duration(milliseconds: 300 + (index * 100)),
                                      tween: Tween(begin: 0.0, end: 1.0),
                                      builder: (context, value, child) {
                                        return Opacity(
                                          opacity: value,
                                          child: Transform.translate(
                                            offset: Offset(0, 20 * (1 - value)),
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 12.h),
                                              child: builditemabsence(controller.listabsence[index]),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  )
                                ),
                              )
                            ) :
                            FadeIn(
                              duration: Duration(milliseconds: 850),
                              child: buildnodata())
                          ),
                        ),
                        if (controller.listabsence.isNotEmpty && controller.listabsence.length == 1)
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15.w),
                            child: InkWell(
                              onTap: () {
                                controller.enableabsenceform();
                              },
                              overlayColor: WidgetStatePropertyAll(Colors.transparent),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                  color: AppColors.black2,
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
                                    "Absen Pulang",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'Medium',
                                      color: AppColors.white
                                    ),
                                  ),
                                )
                              ),
                            ),
                          )
                      ],
                    ),
                  )
                )
            ],
          ),
        ),
      );
    },);
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
          InkWell(
            onTap: () {
              controller.enableabsenceform();
            },
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            child: Container(
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
          ),
        ],
      ),
    );
  }

  Widget builditemabsence(AbsensiModel items) {
    // Convert dd-MM-yyyy to yyyy-MM-dd for parsing
    final dateParts = items.date.split('-');
    final formattedDate = '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}';
    final date = DateFormat('d MMMM y', 'id').format(DateTime.parse(formattedDate));
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.grey25,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child:ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  AppColors.gradient4,
                  AppColors.gradient3,
                ], // Ganti dengan gradient kamu
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ).createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: Icon(
                IconsaxPlusBold.login_1,
                size: 20,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items.labelType,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'SemiBold',
                        color: AppColors.black12,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        color: ColorsSchedule.teal,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            IconsaxPlusBold.camera,
                            size: 16, 
                            color: ColorsStatus.bluetext
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "lihat dokumentasi",
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorsStatus.bluetext,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "${items.time} - $date",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SemiBold',
                    color: AppColors.black8,
                  ),
                ),
                Text(
                  "${items.lat}, ${items.lng}",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'DMSans',
                    color: AppColors.black8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildabsence() {
    final date = DateFormat('EEEE, d MMMM y', 'id').format(DateTime.now());
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
                          controller.name.value,
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
                          controller.typeabsence.value,
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
              height: 300.h,
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
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Lokasi Absensi",
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
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Obx(() => GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: controller.lat.value != 0.0 && controller.long.value != 0.0
                            ? LatLng(controller.lat.value, controller.long.value)
                            : LatLng(-7.2575, 112.7521), // Default Surabaya
                          zoom: 14,
                        ),
                        markers: controller.markers,
                        circles: controller.circles,
                        onMapCreated: (GoogleMapController mapController) {
                          mapController.setMapStyle("[]");
                        },
                        myLocationEnabled: false,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () {
                  controller.doAbsence();
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
  }

}
