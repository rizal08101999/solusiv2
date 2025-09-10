// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:solusi/app/modules/task/controller/detailtask_controllers.dart';
import 'package:solusi/app/routes/app_pages.dart';

import '../../../../../core/colors.dart';
import '../../model/task_model.dart';

class DetailtaskViews extends GetView<DetailtaskControllers> {
  const DetailtaskViews({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                        child: Icon(
                          IconsaxPlusLinear.arrow_left_1,
                          color: AppColors.black,
                          size: 24.sp,
                        ),
                      ),
                      Text(
                        "Detail Tugas",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'SemiBold',
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      gradient: LinearGradient(
                        colors: [
                          controller.datadetail.value!.tipe == "Urgent" ? AppColors.gradientred  : ColorsGradiet.blue,
                          controller.datadetail.value!.tipe == "Urgent" ? AppColors.gradientred2 : ColorsGradiet.white,
                        ], 
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    ),
                    child: Text(
                      controller.datadetail.value!.tipe,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Medium',
                        color: AppColors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildviewsemployee(),
            buildviewsinfo(),
            buildbutton(),
          ],
        ),
      ),
    );
  }

  Widget buildbutton() {
    if (controller.status() == "Belum Diambil") {
      return Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorsGradiet.blue),
            color: Colors.transparent
          ),
          child: Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconsaxPlusBold.tick_circle,
                size: 20,
                color: ColorsGradiet.blue,
              ),
              Text(
                "Ambil Tugas",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Medium',
                  color: ColorsGradiet.blue
                ),
              )
            ],
          ),
        ),
      );
    } else if (controller.datadetail.value!.tipe != "Urgent") {
      return Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.green2),
                color: Colors.transparent
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconsaxPlusBold.tick_circle,
                    size: 20,
                    color: AppColors.green2,
                  ),
                  Text(
                    "Selesai",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Medium',
                      color: AppColors.green2
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorsStatus.redtext),
                color: Colors.transparent
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    IconsaxPlusBold.close_circle,
                    size: 20,
                    color: ColorsStatus.redtext,
                  ),
                  Text(
                    "Batalkan",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Medium',
                      color: ColorsStatus.redtext
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.TRANSFERTASK);
            },
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grey24),
                  color: Colors.transparent
                ),
                child: Row(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconsaxPlusBold.convert_card,
                      size: 20,
                      color: AppColors.grey24,
                    ),
                    Text(
                      "Transfer Tugas",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Medium',
                        color: AppColors.grey24
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildviewsemployee() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 10,
              color: AppColors.black.withOpacity(0.09),  
            )
          ],
          color: AppColors.white
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Text(
              "Pemberi Tugas",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'SemiBold',
                color: AppColors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 10,),
                  Icon(
                    IconsaxPlusBold.profile,
                    size: 20,
                    color: AppColors.grey11,
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.grey10),
                        color: AppColors.bg2
                      ),
                      child: Text(
                        controller.datadetail.value!.pemberiTugas,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Medium',
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildviewsinfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 10,
              color: AppColors.black.withOpacity(0.09),  
            )
          ],
          color: AppColors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              buildrowitem(title: "Juduk Tugas:", value: controller.datadetail.value!.title),
              buildrowitem(title: "Tanggal Tugas:", value: DateFormat('dd MMMM yyyy').format(controller.datadetail.value!.tanggal)),
              buildrowitem(title: "Deadline:", value: DateFormat('dd MMMM yyyy').format(controller.datadetail.value!.deadline)),
              buildrowitem(title: "Catatan", value: "-"),
              buildrowitem(
                title: "Link File", 
                value: null, 
                content: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientnavbar2,
                        AppColors.gradientnavbar
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                  ),
                  child: Row(
                    children: [
                      Icon(
                        IconsaxPlusBold.eye,
                        size: 15,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Lihat Link",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Medium',
                          color: AppColors.white
                        ),
                      )
                    ],
                  ),
                )
              ),
              buildrowitem(
                title: "File", 
                value: null, 
                content: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal:8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientnavbar2,
                        AppColors.gradientnavbar
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                  ),
                  child: Row(
                    children: [
                      Icon(
                        IconsaxPlusBold.eye,
                        size: 15,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "Lihat File",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Medium',
                          color: AppColors.white
                        ),
                      )
                    ],
                  ),
                )
              ),
              buildrowitem(
                title: "Status", 
                value: null, 
                content: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal:8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: colorsStatusbg(controller.datadetail.value!.status)
                  ),
                  child: Text(
                    controller.status(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Medium',
                      color: colorsStatustext(controller.datadetail.value!.status)
                    ),
                  ),
                ),
              ),
              buildrowitem(title: "Tanggal Progress:", value: controller.datadetail.value!.tanggalProgress != null ? DateFormat('dd MMMM yyyy HH:MM').format(controller.datadetail.value!.tanggalProgress!) : "-"),
              buildrowitem(title: "Tanggal Selesai", value: controller.datadetail.value!.tanggalSelesai != null ? DateFormat('dd MMMM yyyy HH:MM').format(controller.datadetail.value!.tanggalSelesai!) :  "-"),
              buildrowitem(title: "Tanggal Batal", value: controller.datadetail.value!.tanggalBatal != null ? DateFormat('dd MMMM yyyy HH:MM').format(controller.datadetail.value!.tanggalBatal!) :  "-"),
              buildrowitem(title: "Lead Time", value: "${controller.datadetail.value!.leadTime} hari"),
            ],
          ),
        ),
      ),
    );
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

  Widget buildrowitem({
    required String title,
    required String? value,
    Widget? content,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.black4
            ),
          ),
        ),
        SizedBox(width:  5,),
        value != null ?
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Medium',
              color: AppColors.black
            ),
          ),
        ) : content!
      ],
    );
  }
}
