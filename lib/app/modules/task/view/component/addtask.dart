// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:solusi/app/widgets/custom_dropdown.dart';
import '../../../../../core/colors.dart';
import '../../../../../core/local_db.dart';
import '../../../../widgets/customcalendar.dart';
import '../../../../widgets/formfield.dart';
import '../../../../widgets/pop_up_load.dart';
import '../../controller/addtask_controllers.dart';

class AddTaskViews extends GetView<AddTaskController> {
  const AddTaskViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gradient,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            gradient: LinearGradient(
              colors: [
                AppColors.gradientnavbar,
                AppColors.gradientnavbar2,
              ], 
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
          child: Text(
            "Simpan tugas",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'SemiBold',
              color: AppColors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 5),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Get.back(),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      child: Icon(
                        IconsaxPlusLinear.arrow_left_1,
                        color: AppColors.black,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  Text(
                    "Tambah Tugas",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Padding(
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
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        FieldForm(
                          label: "Tanggal",
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
                                  color: AppColors.grey11
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
                                  color: AppColors.grey11
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
                          label: "Judul", 
                          controller: controller.titleC, 
                          hintText: "isi judul tugas...", 
                          onChanged: (p0) {
                            if (p0.isNotEmpty) {
                              controller.isnotemptytitle.value = true;
                              controller.isshowrequiredtitle.value = false;
                            } else {
                              controller.isnotemptytitle.value = false;
                              controller.isshowrequiredtitle.value = true;
                            }
                          }, 
                          maxLines: 2,
                          labelStyle: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'SemiBold',
                            color: AppColors.grey11
                          ),
                          isnotemptyfield: controller.isnotemptytitle, 
                          isshowrequiredfield: controller.isshowrequiredtitle
                        ),
                        FieldForm(
                          label: "Catatan", 
                          controller: controller.noteC, 
                          hintText: "isi catatan tugas...", 
                          onChanged: (p0) {
                            if (p0.isNotEmpty) {
                              controller.isnotemptynote.value = true;
                              controller.isshowrequirednote.value = false;
                            } else {
                              controller.isnotemptynote.value = false;
                              controller.isshowrequirednote.value = true;
                            }
                          }, 
                          maxLines: 3,
                          labelStyle: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'SemiBold',
                            color: AppColors.grey11
                          ),
                          isnotemptyfield: controller.isnotemptynote, 
                          isshowrequiredfield: controller.isshowrequirednote
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
                        formupload()
                      ],
                    ),
                  ),
                ),
              )
            )
          ],
        );
      },)
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

  void showcalendar(String args) {
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
                selectedDate: args == "date" ? controller.selectedDatee.value : controller.selectedDatee2.value,
                holidays: LocalDB.holiday!,
                onDateSelected: (date) {
                  if (args == "date") {
                    controller.date.value = DateFormat('dd/MM/yyyy').format(date);
                    controller.selectedDatee.value = date;
                  } else {
                    controller.deadline.value = DateFormat('dd/MM/yyyy').format(date);
                    controller.selectedDatee2.value = date;
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

}
