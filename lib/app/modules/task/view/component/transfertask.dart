// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:solusi/app/widgets/formfield.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/local_db.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/customcalendar.dart';
import '../../../../widgets/pop_up_load.dart';
import '../../controller/transferstask_controllers.dart';
import '../../model/task_model.dart';

class Transfertask extends GetView<TransferstaskControllers> {
  const Transfertask({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientorange2,
                  AppColors.gradientorange,
                ], 
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              )
            ),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  IconsaxPlusBold.ram,
                  size: 20,
                  color: AppColors.white,
                ),
                Text(
                  "Simpan tugas",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SemiBold',
                    color: AppColors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    "Transfer Tugas",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox.shrink()
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildviewstitleandnote(),
                    buildviewsinfo(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  

  Widget buildviewstitleandnote() {
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
            FieldForm(
              label: "Judul", 
              controller: controller.titleC, 
              hintText: "Masukkan Judul....", 
              onChanged: (p0) {
                if(p0.isNotEmpty) {
                  controller.isnotemptytitle.value = true;
                  controller.isshowrequiredtitle.value = false;
                } else {
                  controller.isnotemptytitle.value = false;
                }  
              }, 
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'SemiBold',
                color: AppColors.grey11
              ), 
              isnotemptyfield: controller.isnotemptytitle, 
              isshowrequiredfield: controller.isshowrequiredtitle
            ),
            FieldForm(
              label: "Catatan", 
              controller: controller.noteC, 
              hintText: "Masukkan Catatan...", 
              onChanged: (p0) {
                if(p0.isNotEmpty) {
                  controller.isnotemptynote.value = true;
                  controller.isshowrequirednote.value = false;
                } else {
                  controller.isnotemptynote.value = false;
                }  
              }, 
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'SemiBold',
                color: AppColors.grey11
              ), 
              maxLines: 3,
              isnotemptyfield: controller.isnotemptynote, 
              isshowrequiredfield: controller.isshowrequirednote
            )
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
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Tugas akan dilanjutkan:",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'SemiBold',
                    color: AppColors.black
                  ),
                ),
              ),
              FieldForm(
                label: "Tanggal Mulai",
                onTap: () {
                  showcalendar("date");
                },
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.date.isNotEmpty ? controller.date.value : "Pilih Tanggal",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Medium',
                        color: controller.date.isNotEmpty ? AppColors.black : AppColors.grey11
                      )
                    ),
                    Icon(
                      IconsaxPlusLinear.calendar_search,
                      size: 20.sp,
                      color: AppColors.black9,
                    )
                  ],
                ), 
                controller: null, 
                hintText: null, 
                onChanged: null,
                labelStyle: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'SemiBold',
                  color: AppColors.grey11
                ),
                isnotemptyfield: controller.isnotemptydate, 
                isshowrequiredfield: controller.isshowrequireddate
              ),
              FieldForm(
                label: "Deadline",
                onTap: () {
                  showcalendar("deadline");
                },
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.deadline.isNotEmpty ? controller.deadline.value : "Pilih Tanggal",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: 'Medium',
                        color: controller.deadline.isNotEmpty ? AppColors.black : AppColors.grey11
                      )
                    ),
                    Icon(
                      IconsaxPlusLinear.calendar_search,
                      size: 20.sp,
                      color: AppColors.black9,
                    )
                  ],
                ), 
                controller: null, 
                hintText: null, 
                onChanged: null,
                labelStyle: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'SemiBold',
                  color: AppColors.grey11
                ),
                isnotemptyfield: controller.isnotemptydeadline, 
                isshowrequiredfield: controller.isshowrequireddeadline
              ),
              CustomDropdownField(
                hintText: controller.assignor.isNotEmpty ? controller.assignor.value : "Pilih penerima tugas", 
                isnotemptyfield: controller.isnotemptyassignor, 
                label: "Penerima Tugas", 
                items: ['Budi', 'Tedjo', 'Rani'], 
                onTap: (p0) {
                  controller.assignor.value = p0;
                },
              ),
              CustomDropdownField(
                hintText: controller.type.isNotEmpty ? controller.type.value : "Pilih jenis tugas", 
                isnotemptyfield: controller.isnotemptytype, 
                label: "Jenis", 
                items: ['Urgent', 'Biasa', 'Normal'], 
                onTap: (p0) {
                  controller.type.value = p0;
                },
              ),
              FieldForm(
                label: "Catatan", 
                controller: controller.notetaskC, 
                hintText: "Masukkan Catatan...", 
                onChanged: (p0) {
                  if(p0.isNotEmpty) {
                    controller.isnotemptynotetask.value = true;
                    controller.isshowrequirednotetask.value = false;
                  } else {
                    controller.isnotemptynotetask.value = false;
                  }  
                }, 
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'SemiBold',
                  color: AppColors.grey11
                ), 
                maxLines: 3,
                isnotemptyfield: controller.isnotemptynotetask, 
                isshowrequiredfield: controller.isshowrequirednotetask
              ),
              FieldForm(
                label: "Link(file dari google drive/lainnya)", 
                controller: controller.linkC, 
                hintText: "isi link tugas...", 
                onChanged: (p0) {
                  if (p0.isNotEmpty) {
                    controller.isnotemptylink.value = true;
                    controller.isshowrequiredlink.value = false;
                  } else {
                    controller.isnotemptylink.value = false;
                    controller.isshowrequiredlink.value = true;
                  }
                }, 
                maxLines: 1,
                labelStyle: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: 'SemiBold',
                  color: AppColors.grey11
                ),
                isnotemptyfield: controller.isnotemptylink, 
                isshowrequiredfield: controller.isshowrequiredlink
              ),
              formupload(),
            ],
          ),
        ),
      ),
    );
  }

  Widget formupload() {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          "File/Gambar",
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: 'SemiBold',
            color: AppColors.grey11
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.grey10),
            color: AppColors.white
          ),
          child: Row(
            spacing: 10,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: AppColors.grey23),
                  color: AppColors.grey22
                ),
                child: Text(
                  "Pilih File",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Medium',
                    color: AppColors.black
                  ),
                ),
              ),
              Text(
                controller.file.value != null ? controller.file.value!.path.split('/').last : "Tidak ada file yang dipilih",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Medium',
                  color: AppColors.black
                ),
              )
            ],
          ),
        )
      ],
    ),);
  }

  void showcalendar(String type) {
    Get.dialog(
      barrierDismissible: false,
      PopUpLoad()
    );
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      Get.back();
      Get.dialog(
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: SizedBox(
              height: 330, // Sesuaikan tinggi dialog
              child: CustomCalendar(
                selectedDate: type == "date" ? controller.datee.value : controller.deadlinee.value,
                holidays: LocalDB.holiday!,
                onDateSelected: (date) {
                  if (type == "date") {
                    controller.date.value = DateFormat('dd/MM/yyyy').format(date);
                    controller.datee.value = date;
                  } else {
                    controller.deadline.value = DateFormat('dd/MM/yyyy').format(date);
                    controller.deadlinee.value = date;
                  }
                  Get.back();
                },
                page: "History",  
              ),
            ),
          ),
        ),
      );
    },);
    
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
