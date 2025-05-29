import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/vaadin.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:solusi/app/routes/app_pages.dart';
import 'package:solusi/core/colors.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 35.sp, left: 20.sp, right: 20.sp),
          child: SingleChildScrollView(
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data Kepegawaian",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: DataColors.black
                      ),
                    ),
                    Wrap(
                      spacing: 38, // Jarak horizontal antar item
                      runSpacing: 25, // Jarak vertikal antar baris
                      alignment: WrapAlignment.start,
                      children: [
                        _buildMenuItem2(
                          icon: Icon(IconsaxPlusLinear.user_square, size: 24, color: DataColors.white,),
                          label: "Biodata",
                          onTap: () => Get.toNamed(Routes.BIODATA),
                        ),
                        _buildMenuItem2(
                          icon: Iconify(Ic.baseline_diversity_3, size: 26, color: DataColors.white,),
                          label: "PKWT",
                          onTap: () => Get.toNamed(Routes.PKWT),
                        ),
                        _buildMenuItem2(
                          icon: Iconify(Ri.file_info_fill, size: 26, color: DataColors.white,),
                          label: "Surat\nPeringatan",
                          onTap: () {
            
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  spacing: 15,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jadwal Kerja Dan Absensi",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: DataColors.black,
                      ),
                    ),
                    Wrap(
                      spacing: 40, // Jarak horizontal antar item
                      runSpacing: 25, // Jarak vertikal antar baris
                      alignment: WrapAlignment.start,
                      children: [
                        _buildMenuItem(
                          icon: Icon(IconsaxPlusLinear.clock_1, size: 24, color: DataColors.white,),
                          label: "Jadwal",
                          onTap: () => Get.toNamed(Routes.JADWAL),
                        ),
                        _buildMenuItem(
                          icon: Iconify(MaterialSymbols.fingerprint,
                              size: 26, color: DataColors.white),
                          label: "Absensi",
                          onTap: () => Get.toNamed(Routes.ABSENSI),
                        ),
                        _buildMenuItem(
                          icon: Iconify(Vaadin.calendar_clock,
                              size: 26, color: DataColors.white),
                          label: "Riwayat",
                          onTap: () => Get.toNamed(Routes.RIWAYAT),
                        ),
                        _buildMenuItem(
                          icon: Icon(IconsaxPlusLinear.user_tag, size: 24, color: DataColors.white,),
                          label: "Lembur",
                          onTap: () {
            
                          },
                        ),
                        _buildMenuItem(
                          icon: Iconify(Ri.file_user_line, size: 24, color: DataColors.white,) ,
                          label: "Izin/Cuti",
                          onTap: () {
            
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tugas dan Gaji",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: DataColors.black,
                        ),
                      ),
                      Wrap(
                        spacing: 38, // Jarak horizontal antar item
                        runSpacing: 25, // Jarak vertikal antar baris
                        alignment: WrapAlignment.start,
                        children: [
                          _buildMenuItem3(
                            icon: Icon(IconsaxPlusLinear.document_normal, size: 24, color: DataColors.white,),
                            label: "Task",
                            onTap: () {},
                          ),
                          _buildMenuItem3(
                            icon: Icon(IconsaxPlusLinear.dollar_circle, size: 26, color: DataColors.white,),
                            label: "Gaji",
                            onTap: () {},
                          ),
                          _buildMenuItem3(
                            icon: Icon(IconsaxPlusLinear.status_up, size: 26, color: DataColors.white,),
                            label: "KPI",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: DataColors.grey900,
            child: icon,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: DataColors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem2({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: DataColors.bg,
            child: icon,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: DataColors.black,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem3({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: DataColors.green,
            child: icon,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: DataColors.black,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

}
