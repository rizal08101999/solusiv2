// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:solusi/core/colors.dart';
import '../controller/sp_controller.dart';
import '../model/sp_model.dart';

class SpViews extends GetView<SpController> {
  const SpViews({super.key});


  @override
  Widget build(BuildContext context) {
    print(  controller.spData.length);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10.h),
        child: Obx(() => Column(
          children: List.generate(controller.spData.length, (index) {
            final sp = controller.spData[index];
            return builditemsp(sp);
          }),
        )),
      )
    );
  }

  Widget builditemsp(SpEntity sp) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey10.withOpacity(0.5))
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientnavbar,
                  AppColors.gradientnavbar2.withOpacity(0.8),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              "SP",
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Medium',
                color: AppColors.white
              ),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sp.jenis, 
                      style: TextStyle(
                        fontSize: 16.sp, 
                        fontFamily: 'SemiBold',
                        color: AppColors.black2
                      )
                    ),
                    Text(
                      sp.keterangan, 
                      style: TextStyle(
                        fontSize: 13.sp, 
                        fontFamily: 'DMSans',
                        color: AppColors.grey14
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.gradientnavbar.withOpacity(0.5),
                child: Icon(
                  IconsaxPlusLinear.document_text,
                  color: AppColors.gradientnavbar2,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.grey10.withOpacity(0.5),
            height: 1.h,
          ),
          Row(
            children: [
              Icon(
                IconsaxPlusLinear.calendar,
                color: AppColors.black2,
                size: 16.sp,
              ),
              SizedBox(width: 5.w),
              Text(
                sp.berlaku,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.black2
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
