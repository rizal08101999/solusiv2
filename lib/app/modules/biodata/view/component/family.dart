// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/core/colors.dart';
import 'package:solusi/app/modules/biodata/controller/biodata_controller.dart';

class Family extends GetView<BiodataController> {
  const Family({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => builditemform(
            title: "Nama Ayah Kandung",
            value: controller.getFamilyDataByTitle("Nama Ayah Kandung").toString(),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Nama Ibu Kandung",
            value: controller.getFamilyDataByTitle("Nama Ibu Kandung").toString(),
            isRow: false,
          )),
          Obx(() => builditemform(
            title: "Nama Suami / Istri",
            value: controller.getFamilyDataByTitle("Nama Suami / Istri").toString(),
            isRow: false,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5,),
            child: Text(
              "Data Anak", 
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: 'SemiBold',
                color: AppColors.black2,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Obx(() {
              final anakData = controller.getFamilyDataByTitle("Data Anak");
              final anakList = (anakData is List) ? anakData.cast<Map<String, dynamic>>() : <Map<String, dynamic>>[];
              return Column(
                children: [
                  buildRow(['Nama', 'Jenis Kelamin', 'Tanggal Lahir'], isHeader: true, rowIndex: 0, totalRows: anakList.length + 1, fixedWidth: 130, fixedWidth2: 110),
                  ...List.generate(anakList.length, (i) {
                    final item = anakList[i];
                    return buildRow([
                      item['nama'] ?? '',
                      item['jk'] ?? '',
                      item['tgl'] ?? '',
                    ], isHeader: false, rowIndex: i + 1, totalRows: anakList.length + 1, fixedWidth: 130, fixedWidth2: 110);
                  }),   
                ],
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 10),
            child: Text(
              "Data Kerabat", 
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: 'SemiBold',
                color: AppColors.black2,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Obx(() {
              final kerabatData = controller.getFamilyDataByTitle("Data Kerabat");
              final kerabatList = (kerabatData is List) ? kerabatData.cast<Map<String, dynamic>>() : <Map<String, dynamic>>[];
              return Column(
                children: [
                  buildRow(['Nama', 'Hubungan', 'Telp/WA'], isHeader: true, rowIndex: 0, totalRows: kerabatList.length + 1, fixedWidth: 100, fixedWidth2: 100),
                  ...List.generate(kerabatList.length, (i) {
                    final item = kerabatList[i];
                    return buildRow([
                      item['nama'] ?? '',
                      item['hubungan'] ?? '',
                      item['telp'] ?? '',
                    ], isHeader: false, rowIndex: i + 1, totalRows: kerabatList.length + 1, fixedWidth: 100, fixedWidth2: 100);
                  }),   
                ],
              );
            }),
          ),
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
                      width: double.infinity,
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
                      width: double.infinity,
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

  Widget buildRow(
    List<String> cells, {
    bool isHeader = false,
    required int rowIndex,
    required int totalRows,
    double? fixedWidth,
    double? fixedWidth2,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(cells.length, (index) {
          final isFirst = index == 0;
          
          Widget cellContent = Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.grey10, width: 0.8),
                right: BorderSide(color: AppColors.grey10, width: 0.8),
                bottom: BorderSide(color: AppColors.grey10, width: 0.8),
                left: isFirst ? BorderSide(color: AppColors.grey10, width: 0.8) : BorderSide.none,
              ),
              color: isHeader ? AppColors.grey10.withOpacity(0.3) : Colors.white,
            ),
            child: Text(
              cells[index],
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: isHeader ? 'SemiBold' : 'Medium',
                color: AppColors.black2,
              ),
              textAlign: TextAlign.center,
            ),
          );
          
          if (index == 0 && fixedWidth != null) {
            return SizedBox(width: fixedWidth, child: cellContent);
          } else if (index == 1 && fixedWidth2 != null) {
            return SizedBox(width: fixedWidth2, child: cellContent);
          } else {
            return Expanded(child: cellContent);
          }
        }),
      ),
    );
  }
}