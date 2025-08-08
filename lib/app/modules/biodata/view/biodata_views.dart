// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/app/modules/biodata/view/component/personaldata.dart';
import 'package:solusi/core/colors.dart';
import '../controller/biodata_controller.dart';
import 'component/bank.dart';
import 'component/education.dart';
import 'component/family.dart';
import 'component/insurance.dart';
import 'component/staffing.dart';

final itemsdata = {
  "Data Pribadi" : IconsaxPlusBold.profile,
  "Data Pendidikan" : IconsaxPlusBold.teacher,
  "Data Kepegawaian" : IconsaxPlusBold.briefcase,
  "Data Keluarga" : IconsaxPlusBold.people,
  "Data Asuransi BPJS dll" : IconsaxPlusBold.hospital,
  "Data Bank" : IconsaxPlusBold.card,
};

class BiodataViews extends GetView<BiodataController> {
  const BiodataViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 15.h),
              scrollDirection: Axis.horizontal,
              controller: controller.scrollfilterC,
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(itemsdata.length, (index) => builditemnavbar(index,))
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IndexedStack(
                  index: controller.currentindex.value,
                  children: [
                    Personaldata(),
                    Education(),
                    Staffing(),
                    Family(),
                    Insurance(),
                    Bank(),
                  ],
                ),
              ),
            )

          ],
        );
      },),
    );
  }

  Widget builditemnavbar(int index) {
    return Obx(() {
      return InkWell(
        onTap: () => controller.selectIndex(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: controller.currentindex.value == index ?
          BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.gradientnavbar,
                AppColors.gradientnavbar2.withOpacity(0.8),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(999),
          ) :
          BoxDecoration(
            color: AppColors.grey9.withOpacity(0.09),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            spacing: 5,
            children: [
              if(controller.currentindex.value == index)
              Icon(
                itemsdata.values.elementAt(index),
                color: controller.currentindex.value == index ? AppColors.white : AppColors.black2,
                size: 18.sp,
              ),
              Text(
                itemsdata.keys.elementAt(index),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: controller.currentindex.value == index ? AppColors.white : AppColors.black2,
                ),
              )
            ],
          ),
        ),
      );
    },);
  }
}
