import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/core/colors.dart';
import 'package:solusi/app/modules/biodata/controller/biodata_controller.dart';

class Personaldata extends GetView<BiodataController> {
  const Personaldata({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => builditemform(
            title: "No. KTP",
            value: controller.getDataByTitle("No KTP"),
            isRow: true,
            title2: "No. KK",
            value2: controller.getDataByTitle("No KK"),
          )),
          Obx(() => builditemform(
            title: "Nama",
            value: controller.getDataByTitle("Nama"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Panggilan",
            value: controller.getDataByTitle("Panggilan"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Tempat tanggal lahir",
            value: controller.getDataByTitle("TTL"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Jenis Kelamin",
            value: controller.getDataByTitle("Jenis Kelamin"),
            isRow: true,
            title2: "Agama",
            value2: controller.getDataByTitle("Agama"),
          )),
          Obx(() => builditemform(
            title: "Domisili",
            value: controller.getDataByTitle("Domisili") == "-" ? "belum ada domisili" : controller.getDataByTitle("Domisili"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Desa/Dusun",
            value: controller.getDataByTitle("Desa/Dusun"),
            isRow: true,
            title2: "Kecamatan",
            value2: controller.getDataByTitle("Kecamatan"),
          )),
          Obx(() => builditemform(
            title: "Kota/Kab",
            value: controller.getDataByTitle("Kota/Kab"),
            isRow: true,
            title2: "Provinsi",
            value2: controller.getDataByTitle("Provinsi"),
          )),
          Obx(() => builditemform(
            title: "Status Menikah",
            value: controller.getDataByTitle("Status Nikah"),
            isRow: true,
            title2: "Telp",
            value2: controller.getDataByTitle("Telp"),
          )),
          Obx(() => builditemform(
            title: "Email",
            value: controller.getDataByTitle("Email").replaceAll('mailto:', ''),
            isRow: false,
          )),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget builditemform({
    required String title,
    required String value,
    required bool isRow,
    String? title2,
    String? value2,
    VoidCallback? onTap,
  }) {
    if (isRow == true) {
      return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              // Bagian kiri
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13.sp, 
                        fontFamily: 'SemiBold',
                        color: AppColors.grey11,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity, // Tambahkan ini
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.grey10,
                        ),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              // Bagian kanan
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title2 ?? "",
                      style: TextStyle(
                        fontSize: 13.sp, 
                        fontFamily: 'SemiBold',
                        color: AppColors.grey11,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity, // Tambahkan ini
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.grey10,
                        ),
                      ),
                      child: Text(
                        value2 ?? "",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp, 
                fontFamily: 'SemiBold',
                color: AppColors.grey11,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.grey10,
                ),
              ),
              child: Text(
                value,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      );
    }
    
  }
}