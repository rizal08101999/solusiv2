import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/core/colors.dart';
import 'package:solusi/app/modules/biodata/controller/biodata_controller.dart';

class Education extends GetView<BiodataController> {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => builditemform(
            title: "Pendidikan Terakhir",
            value: controller.getEducationDataByTitle("Pendidikan Terakhir"),
            isRow: true,
            title2: "Gelar",
            value2: controller.getEducationDataByTitle("Gelas"),
          )),
          Obx(() => builditemform(
            title: "Nilai IPK/Rapor",
            value: controller.getEducationDataByTitle("Nilai IPK / Nilai Rapor"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Nama Instansi",
            value: controller.getEducationDataByTitle("Nama Sekolah"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Fakultas",
            value: controller.getEducationDataByTitle("Fakultas"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Jurusan",
            value: controller.getEducationDataByTitle("Jurusan"),
            isRow: false,
          )),
          // Obx(() => builditemform(
          //   title: "Kota/Kab",
          //   value: controller.getEducationDataByTitle("Kota/Kab"),
          //   isRow: true,
          //   title2: "Provinsi",
          //   value2: controller.getEducationDataByTitle("Provinsi"),
          // )),
          Obx(() => builditemform(
            title: "Konsentrasi",
            value: controller.getEducationDataByTitle("Konsentrasi"),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Alamat Instansi",
            value: controller.getEducationDataByTitle("Alamat Instansi"),
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