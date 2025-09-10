// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../../core/colors.dart';
import '../../../routes/app_pages.dart';
import '../controller/leave_controller.dart';

class LeaveViews extends GetView<LeaveController> {
  const LeaveViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: SpeedDial(
          elevation: 0,
          spacing: 15,
          openCloseDial: controller.isDialOpen,
          children: [
            items(
              title: "Cuti Bulanan", 
              icon: IconsaxPlusLinear.calendar_edit, 
              size: 24,
              onTap: () {
                Get.toNamed(Routes.ADDLEAVE, arguments: "Izin Cuti Bulanan");
              }
            ),
            items(
              title: "Izin tidak masuk", 
              icon: IconsaxPlusLinear.brifecase_cross,
              size: 24, 
              onTap: () {
                Get.toNamed(Routes.ADDLEAVE, arguments: "Izin Tidak Masuk");
              }
            ),
            items(
              title: "Izin Terlambat", 
              icon: IconsaxPlusLinear.import_1, 
              size: 20,
              onTap: () {
                Get.toNamed(Routes.ADDLEAVE, arguments: "Izin Terlambat");
              }
            ),
            items(
              title: "Izin Pulang Duluan", 
              icon: IconsaxPlusLinear.export_2, 
              size: 20,
              onTap: () {
                Get.toNamed(Routes.ADDLEAVE, arguments: "Izin Pulang Duluan");
              }
            ),
          ],
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.gradient3,
                  AppColors.gradient4
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              )
            ),
            child: ValueListenableBuilder<bool>(
              valueListenable: controller.isDialOpen,
              builder: (context, isOpen, _) {
                return AnimatedRotation(
                  turns: isOpen ? 0.125 : 0, // 0.125 putaran = 45 derajat
                  duration: Duration(milliseconds: 250),
                  child: Center(
                    child: Icon(
                      IconsaxPlusLinear.add,
                      size: 38,
                      color: AppColors.white,
                    ),
                  ),
                );
              },
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
                    "Izin/Cuti Pegawai",
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
                padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
                child: ListView.builder(itemBuilder: (context, index) => builditemleave(), itemCount: 3,)
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget builditemleave() {
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
        child: IntrinsicHeight(
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
                          Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Izin Cuti",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'SemiBold',
                                  color: AppColors.black,
                                ),
                              ),
                              Row(
                                spacing: 5,
                                children: [
                                  ShaderMask(
                                    shaderCallback: (bounds) => LinearGradient(
                                      colors: [
                                        AppColors.gradient3,
                                        AppColors.gradient4
                                      ], // Ganti dengan gradient kamu
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds),
                                    blendMode: BlendMode.srcIn,
                                    child: Icon(
                                      IconsaxPlusLinear.calendar,
                                      size: 24, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: ShaderMask(
                                      shaderCallback: (bounds) => LinearGradient(
                                        begin: Alignment.bottomCenter, // mulai dari bawah
                                        end: Alignment.topCenter,     // ke atas
                                        colors: [
                                          AppColors.gradient4,
                                          AppColors.gradient3,
                                        ],
                                      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                                      child: Text(
                                        "18 Sept 2025 - 19 Sept 2025",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white, // wajib set putih, supaya gradient kelihatan
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              color: ColorsSchedule.red,
                            ),
                            child: Text(
                              "Telah ditolak",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'SemiBold',
                                color: AppColors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: AppColors.grey20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          buildrowitem(title: "Kode", value: "PM2506-0100"),
                          buildrowitem(title: "Catatan", value: "Sakit"),
                          buildrowitem(title: "Ketentuan", value: "Ketentuan"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SpeedDialChild items({
    required String title,
    required IconData icon,
    required double size,
    required VoidCallback onTap,
  }) {
    return SpeedDialChild(
      shape: CircleBorder(),
      child: ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          AppColors.gradient3,
          AppColors.gradient4
        ],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
      ).createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: Icon(
        icon,
        size: size, 
      ),
    ),
      labelWidget: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientnavbar2, AppColors.gradientnavbar],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ),
      onTap: onTap,
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
