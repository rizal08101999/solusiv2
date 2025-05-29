// ignore_for_file: use_key_in_widget_constructors,

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/data/entities/absen.dart';
import 'package:solusi/app/modules/home/controllers/home_controller.dart';
import 'package:solusi/core/colors.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => controller.loading.isTrue ? 
        const Scaffold(
          body: SizedBox.shrink(),
        ) : 
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                height: 220,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg_home.jpg'),
                      fit: BoxFit.fill
                  ),
                ),
                child: Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text(
                        "Selamat Datang Di Aplikasi SOLUSI",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    Text(
                      "testing",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      "Dashboard berisi resume selama satu bulan aktif",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Resume",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'Poppins-Bold',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            spacing: 15,
                            children: [
                              builditemresume(icon: IconsaxPlusLinear.login, title: "Absen Masuk", subtitle: "-"),
                              builditemresume(icon: IconsaxPlusLinear.logout, title: "Absen Keluar", subtitle: "-"),
                              builditemresume(icon: IconsaxPlusBold.note_1, title: "Total Tugas Saya", subtitle: "4 Data"),
                              builditemresume(icon: IconsaxPlusLinear.user_octagon, title: "Total Izin/Cuti Menunggu Konfirmasi", subtitle: "0 Data"),
                              builditemresume(icon: IconsaxPlusBold.tick_circle, title: "Total Izin/Cuti Terkonfirmasi", subtitle: "0 Data"),
                              builditemresume(icon: IconsaxPlusLinear.user_square, title: "Total Lembur Menunggu Konfirmasi", subtitle: "0 Data"),
                              builditemresume(icon: IconsaxPlusBold.tick_circle, title: "Total Izin Terkonfirmasi", subtitle: "0 Data"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ) 
      
    );
  }

  Widget builditemresume({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 8,
          children: [
            Icon(
              icon,
              size: 26,
              color: DataColors.grey2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: DataColors.black
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Poppins-Bold',
                      color: subtitle == "-" ? DataColors.grey : DataColors.black
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Icon(
          IconsaxPlusLinear.arrow_right,
          size: 24,
          color: DataColors.grey2,
        )
      ],
    );
  }

  builCardAbsen(AbsensiEntity item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20.sp, left: 0.sp),
              child: Icon(
                item.label == "Absen Masuk" ? Icons.login_rounded : Icons.logout_rounded,
                size: 24.sp,
                color: DataColors.bg,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.sp, left: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: DataColors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.sp),
                    child: Text(
                      item.date,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: DataColors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        item.status != "" ?
        Padding(
          padding: EdgeInsets.only(top: 0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.label == "Absen Masuk" ? item.timeIn : item.timeOut,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Poppins-Bold',
                    color: DataColors.black),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.sp),
                child: Text(
                  item.status,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: item.status == "Terlambat" || item.status == "Pulang Duluan" ? DataColors.red700 : DataColors.black),
                ),
              )
            ],
          ),
        ) : Text(
          item.label == "Absen Masuk" ? item.timeIn : item.timeOut,
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Poppins-Bold',
              color: item.status == "Terlambat" || item.status == "Pulang Duluan" ? DataColors.red700 : DataColors.black),
        ),
      ],
    );
  }
}
