// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/menu/controllers/biodata_controller.dart';
import 'package:solusi/core/colors.dart';

const tabBar = [
  'Data Pribadi',
  'Data Pendidikan',
  'Data Kepegawaian',
  'Data Keluarga',
  'Data Asuransi BPJS & Lainnya',
  'Data Bank'
];

class BiodataView extends GetView<BiodataController> {
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
                      "Biodata Pegawai",
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
            padding: EdgeInsets.only(top: 20.sp, left: 0.sp, right: 0.sp),
            height:MediaQuery.of(context).size.height <= 750
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
                Padding(
                  padding: EdgeInsets.only(right: 15.sp, left: 15.sp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(tabBar.length,
                          (index) => buildTabbar(index, tabBar[index])),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.sp),
                    child: Obx(() => IndexedStack(
                          index: controller.tabIndex.value,
                          children: [
                            DataPribadi(),
                            DataPendidikan(),
                            DataKepegawaian(),
                            DataKeluarga(),
                            DataBPJS(),
                            DataBank(),
                          ],
                        )),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget buildTabbar(
    int index,
    String title,
  ) {
    return InkWell(
      onTap: () => controller.selectTab(index),
      child: Obx(() => controller.tabIndex.value == index
          ? Padding(
              padding: EdgeInsets.only(right: 8.sp),
              child: Container(
                height: 40.sp,
                width: title == "Data Asuransi BPJS & Lainnya"
                    ? 190.sp
                    : title == "Data Bank"
                        ? 85.sp
                        : title == "Data Kepegawaian"
                            ? 130.sp
                            : title == "Data Pribadi"
                                ? 100.sp
                                : 120.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: DataColors.bg,
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: DataColors.white),
                  ),
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.only(right: 8.sp),
              child: Container(
                height: 40.sp,
                width: title == "Data Asuransi BPJS & Lainnya"
                    ? 190.sp
                    : title == "Data Bank"
                        ? 85.sp
                        : title == "Data Kepegawaian"
                            ? 130.sp
                            : title == "Data Pribadi"
                                ? 100.sp
                                : 120.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  color: DataColors.white,
                  border: Border.all(color: DataColors.bg),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: DataColors.bg),
                  ),
                ),
              ),
            )),
    );
  }
}

class DataPribadi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.sp, right: 15.sp, left: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "No KTP",
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
                    "1616161616161616",
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
              "No KK",
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
                    "1616161616161616",
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
              "Nama",
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
                    "testing",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
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
              "Panggilan",
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
                    "",
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
              "Jenis Kelamin",
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
                    "-",
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
              "Agama",
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
                    "-",
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
              "TTL",
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
                    "Kediri, 30 Januari 2029",
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
              "Domisili",
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
                    "Kediri",
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
              "Desa/Dusun",
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
                    "belum ada desa atau dusun",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: DataColors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Kecamatan",
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
                    "belum ada kecamatan",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: DataColors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Kota/Kab",
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
                    "belum ada kota atau kab",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: DataColors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Provinsi",
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
                    "belum ada provinsi",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w600,
                      color: DataColors.black.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              "Status Nikah",
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
                    "BELUM MENIKAH",
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
              "Telp",
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
                    "08111111111",
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
              "Email",
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
                    "testing@gmail.com",
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
          ],
        ),
      ),
    );
  }
}

class DataPendidikan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.sp, right: 15.sp, left: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pendidikan Terakhir",
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
                    "SD",
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
              "Gelar",
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
                    "",
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
              "Nilai IPK / Nilai Raport",
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
                    "0",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
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
              "Nama Sekolah",
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
                    "",
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
              "Fakultas",
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
                    "",
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
              "Jurusan",
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
                    "",
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
              "Konsentrasi",
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
                    "",
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
              "Alamat Sekolah",
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
                    "",
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
          ],
        ),
      ),
    );
  }
}

class DataKepegawaian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.sp, right: 15.sp, left: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Perusahaan",
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
                    "KA4 Expedition",
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
              "No Induk",
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
                    "KA47001D1000",
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
              "Jenis Pegawai",
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
                    "-",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
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
              "Divisi",
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
                    "Operational",
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
              "Departement",
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
                    "DAIAHATSU123",
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
              "Penempatan",
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
                    "DAIAHATSU123",
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
          ],
        ),
      ),
    );
  }
}

class DataKeluarga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
             padding: EdgeInsets.only( left: 15.sp),
            child: Text(
              "Nama Ayah Kandung",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: DataColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.sp, left: 15.sp),
            child: Container(
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
                    "",
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
          ),
          SizedBox(
            height: 10.sp,
          ),
          Padding(
             padding: EdgeInsets.only( left: 15.sp),
            child: Text(
              "Nama Ibu Kandung",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: DataColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.sp, left: 15.sp),
            child: Container(
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
                    "",
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
          ),
          SizedBox(
            height: 10.sp,
          ),
          Padding(
            padding: EdgeInsets.only( left: 15.sp),
            child: Text(
              "Nama Suami / Istri",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: DataColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.sp, left: 15.sp),
            child: Container(
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
                    "",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                      color: DataColors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Padding(
             padding:EdgeInsets.only(right: 10.sp, left: 15.sp),
            child: Text(
              "Data Anak",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: DataColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: DataTable(
              border: TableBorder.all(color: DataColors.bg),
              dataRowHeight: 30,
              headingRowHeight: 40,
              headingRowColor:  MaterialStatePropertyAll(DataColors.headertable),
                dataRowColor: MaterialStatePropertyAll(DataColors.headertable),
              columns: [
                DataColumn(
                  label: SizedBox(
                    width: 40.sp, // Atur panjang kolom untuk "Name"
                    child: Text(
                      'NAMA',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: DataColors.black,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Center(
                    child: SizedBox(
                      width: 90.sp, // Atur panjang kolom untuk "Age"
                      child: Center(
                          child: Text(
                        'JENIS \nKELAMIN',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                          color: DataColors.black,
                        ),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'TANGGAL LAHIR',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: DataColors.black,
                    ),
                  )),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('')),
                    DataCell(Text('')),
                    DataCell(Text('')),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Padding(
            padding: EdgeInsets.only( left: 15.sp),
            child: Text(
              "Data Kerabat",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: DataColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Expanded(
            child: DataTable2(
              border: TableBorder.all(color: DataColors.bg),
              dataRowHeight: 60,
              minWidth: 365,
              headingRowHeight: 40,
              // horizontalMargin: 5,
              headingRowColor:  MaterialStatePropertyAll(DataColors.headertable),
              dataRowColor: MaterialStatePropertyAll(DataColors.headertable),
              columns: [
                DataColumn2(
                  fixedWidth: 110.sp,
                  label: Center(
                    child: Text(
                      'NAMA',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: DataColors.black,
                      ),
                    ),
                  ),
                ),
                DataColumn2(
                  fixedWidth: 120.sp,
                  label: Center(
                    child: Text(
                      'HUBUNGAN',
                      style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                    color: DataColors.black,
                      ),
                    ),
                  ),
                ),
                DataColumn2(
                  fixedWidth: 120.sp,
                  label: Center(
                      child: Text(
                    'TELP/WA',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: DataColors.black,
                    ),
                  )),
                ),
              ],
              rows:<DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('M. ZULKARNAIN',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DataColors.black,
                      ),)),
                    DataCell(Text('ADIK KANDUNG',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: DataColors.black,
                      ))),
                    DataCell(Text('081330047948',style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                        color: DataColors.black,
                      ))),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DataBPJS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.sp, right: 15.sp, left: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BPJS Kesehatan",
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
                    "",
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
              "BPJS Ketenagakerjaan",
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
                    "",
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
              "Asuransi Lain",
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
                    "",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
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
              "No Keanggotaan",
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
                    "",
                    style: TextStyle(
                      fontSize: 14.sp,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                      color: DataColors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DataBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.sp, right: 15.sp, left: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Bank",
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
                    "",
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
              "No Rekening",
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
                    "",
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
          ],
        ),
      ),
    );
  }
}
