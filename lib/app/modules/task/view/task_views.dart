// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solusi/app/modules/task/model/task_model.dart';
import '../../../../core/colors.dart';
import '../../../routes/app_pages.dart';
import '../controller/task_controller.dart';

final itemnavbar = [
  'Tugas Saya',
  'Tugas Selesai',
  'Dibatalkan',
  'Pembuat tugas(saya)',
];

class TaskViews extends GetView<TaskController> {
  const TaskViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 5),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.ADDTASK),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientnavbar2,
                  AppColors.gradientnavbar,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ), 
            ),
            child: Icon(
              IconsaxPlusLinear.add,
              size: 38.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      body: Obx(() {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_pegawai2.png'),
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
                      onTap: () => Get.back(),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      child: Icon(
                        IconsaxPlusLinear.arrow_left_1,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                    ),
                    Text(
                      "Task Management",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'SemiBold',
                        color: AppColors.white
                      ),
                    ),
                    SizedBox.shrink()
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10),
                  width: double.infinity,
                  decoration:  BoxDecoration(
                    color: AppColors.gradient,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.sp),
                      topRight: Radius.circular(25.sp),
                    ),
                  ),
                  child: controller.loading.isTrue ? 
                  buildloading() :
                  FadeIn(
                    duration: Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: controller.scrollfilterC,
                              child: Row(
                                spacing: 10,
                                children: List.generate(itemnavbar.length, (index) => builditemnavbar(index),),
                              ),
                            ),
                          ),
                          SizedBox(height: controller.loadingfilter.isTrue ? 0 : 20,),
                          controller.loadingfilter.isTrue ? 
                          Expanded(child: buildloading()):
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(controller.listtask.length, (index) => builditemleave(controller.listtask[index]),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                )
              ),
            ],
          ),
        );
      },)
    );
  }

  Widget buildloading() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Shimmer.fromColors(
          baseColor: AppColors.grey6,
          highlightColor: AppColors.white,
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: controller.loadingfilter.isTrue ? 0 : 10),
                child: Column(
                  spacing: 30,
                  children: [
                    controller.loadingfilter.isTrue ? 
                    SizedBox.shrink() :
                    SingleChildScrollView(
                      child: Row(
                        spacing: 5,
                        children: List.generate(5, (index) {
                          return Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: AppColors.grey6
                              ),
                            ),
                          );
                        },),
                      ),
                    ),
                    Column(
                      spacing: 10,
                      children: List.generate(5, (index) {
                        return Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.grey6,
                          ),
                        );
                      },),
                    )
                  ],
                ),
              ),
            ),
          ), 
        ),
      );
    },);
  }

  Widget builditemnavbar(int index) {
    return Obx(() {
      return InkWell(
        onTap: () => controller.selectIndex(index, index == 1 ? "selesai" : index == 2 ? "dibatalkan" :""),
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
          child: Text(
            itemnavbar[index],
            style: TextStyle(
              fontSize: 14.sp,
              color: controller.currentindex.value == index ? AppColors.white : AppColors.black2,
            ),
          ),
        ),
      );
    },);
  }

  Widget builditemleave(TaskModel items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () => Get.toNamed(Routes.DETAILTASK, arguments: items),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
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
                      colors: colorsGradient(items.status),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items.title,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'SemiBold',
                                    color: AppColors.black,
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
                                      items.description,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white, // wajib set putih, supaya gradient kelihatan
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: colorsStatusbg(items.status),
                              ),
                              child: Text(
                                items.status.name == TaskStatus.dibatalkan.name ? "Dibatalkan" : items.status.name == TaskStatus.belumDiambil.name ? "Belum Diambil" : items.status.name == TaskStatus.onProgress.name ? "On Progress" : "Selesai",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: 'SemiBold',
                                  color: colorsStatustext(items.status),
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
                            buildrowitem(title: "Tanggal", value: DateFormat('dd MMMM yyyy').format(items.tanggal)),
                            buildrowitem(title: "Deadline", value: DateFormat('dd MMMM yyyy').format(items.deadline)),
                            buildrowitem(title: "Tipe", value: items.tipe),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                Icon(
                                  IconsaxPlusBold.profile,
                                  color: AppColors.grey19,
                                  size: 20,
                                ),
                                Text(
                                  "Pemberi Tugas",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.grey19
                                  ),
                                )
                              ],
                            ),
                            Text(
                              items.pemberiTugas,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'SemiBold',
                                color: AppColors.black11
                              ),
                            )
                          ],
                        ),
                      )
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

  List<Color> colorsGradient(TaskStatus status) {
    switch (status) {
      case TaskStatus.belumDiambil:
        return [ColorsGradiet.orange2, ColorsGradiet.orange1];
      case TaskStatus.onProgress:
        return [ColorsGradiet.blue2, ColorsGradiet.blue];
      case TaskStatus.selesai:
        return [ColorsGradiet.green2, ColorsGradiet.green];
      case TaskStatus.dibatalkan:
        return [ColorsGradiet.red2, ColorsGradiet.red];
    }
  }

  Color colorsStatustext(TaskStatus status) {
    switch (status) {
      case TaskStatus.belumDiambil:
        return ColorsStatus.orangetext;
      case TaskStatus.onProgress:
        return ColorsStatus.bluetext;
      case TaskStatus.selesai:
        return ColorsStatus.greentext;
      case TaskStatus.dibatalkan:
        return ColorsStatus.redtext;
    }
  }

  Color colorsStatusbg(TaskStatus status) {
    switch (status) {
      case TaskStatus.belumDiambil:
        return ColorsStatus.orangebg;
      case TaskStatus.onProgress:
        return ColorsStatus.bluebg;
      case TaskStatus.selesai:
        return ColorsStatus.greenbg;
      case TaskStatus.dibatalkan:
        return ColorsStatus.redbg;
    }
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
