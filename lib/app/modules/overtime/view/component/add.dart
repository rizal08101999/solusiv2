// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:solusi/app/modules/overtime/controller/add_controllers.dart';
import 'package:solusi/app/widgets/formfield.dart';
import 'package:solusi/core/colors.dart';
import 'package:solusi/core/local_db.dart';

import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_timepicker.dart';
import '../../../../widgets/customcalendar.dart';
import '../../../../widgets/pop_up_load.dart';

class AddViews extends GetView<AddControllers> {
  const AddViews({super.key});

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.90;
    return Scaffold(
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
                    "Pengaturan Jadwal",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 3),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: maxHeight
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grey10)
                    ),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: CustomDropdownField(
                                hintText: controller.name.isNotEmpty ? controller.name.value : "Pilih Pegawai", 
                                label: "Pegawai",
                                items: ["Budi", "Jiji", "Gunawan"],
                                onTap: (p0) {
                                  controller.name.value = p0;
                                },
                                isnotemptyfield: controller.name.isNotEmpty.obs,
                              ),
                            ),
                            FieldForm(
                              label: "Nama Lembur", 
                              controller: controller.nameovertimeC, 
                              hintText: "Lembur harian...", 
                              onChanged: (p0) {
                                if (p0.isNotEmpty) {
                                  controller.isnotemptyname.value = true;
                                  controller.isshowrequiredname.value = false;
                                } else {
                                  controller.isnotemptyname.value = false;
                                  controller.isshowrequiredname.value = true;
                                }
                              }, 
                              labelStyle: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'SemiBold',
                                color: AppColors.grey11
                              ),
                              isnotemptyfield: controller.isnotemptyname, 
                              isshowrequiredfield: controller.isshowrequiredname
                            ),
                            FieldForm(
                              label: "Keterangan", 
                              controller: controller.nameovertimeC, 
                              hintText: "Keterangan lembur...", 
                              onChanged: (p0) {
                                if (p0.isNotEmpty) {
                                  controller.isnotemptyinfo.value = true;
                                  controller.isshowrequiredinfo.value = false;
                                } else {
                                  controller.isnotemptyinfo.value = false;
                                  controller.isshowrequiredinfo.value = true;
                                }
                              }, 
                              maxLines: 3,
                              labelStyle: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'SemiBold',
                                color: AppColors.grey11
                              ),
                              isnotemptyfield: controller.isnotemptyinfo, 
                              isshowrequiredfield: controller.isshowrequiredinfo
                            ),
                            CustomDropdownField(
                              hintText: controller.info.isNotEmpty ? controller.info.value : "Pilih Jenis Lembur", 
                              label: "Jenis Lembur",
                              items: ["Lembur Harian", "Lembur Mingguan", "Lembur Bulanan"],
                              onTap: (p0) {
                                controller.info.value = p0;
                              },
                              isnotemptyfield: controller.info.isNotEmpty.obs,
                            ),
                            FieldForm(
                              label: "Tanggal",
                              onTap: () {
                                showcalendar();
                              },
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.date.isNotEmpty ? controller.date.value : "Tanggal",
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
                              label: "Jam Masuk",
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  builder: (context) {
                                    return CustomTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      onTimeSelected: (time) {
                                        controller.hoursin.value = time.format(context);
                                      },
                                    );
                                  },
                                );
                              },
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.hoursin.isNotEmpty ? controller.hoursin.value : "Isi Jam Masuk",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'Medium',
                                      color: AppColors.grey11
                                    )
                                  ),
                                  Icon(
                                    IconsaxPlusLinear.timer_1,
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
                              isnotemptyfield: controller.isnotemptyhoursin, 
                              isshowrequiredfield: controller.isshowrequiredhoursin
                            ),
                            FieldForm(
                              label: "Jam Pulang",
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  builder: (context) {
                                    return CustomTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      onTimeSelected: (time) {
                                        controller.hoursout.value = time.format(context);
                                      },
                                    );
                                  },
                                );
                              },
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.hoursout.isNotEmpty ? controller.hoursout.value : "Isi Jam Pulang",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'Medium',
                                      color: AppColors.grey11
                                    )
                                  ),
                                  Icon(
                                    IconsaxPlusLinear.timer_1,
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
                              isnotemptyfield: controller.isnotemptyhoursout, 
                              isshowrequiredfield: controller.isshowrequiredhoursout
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,),
                              child: Row(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "(*klik untuk simpan data)",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'DMSans',
                                      color: AppColors.black10
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(999),
                                      color: AppColors.black4,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          color: AppColors.black.withOpacity(0.25),  
                                        )
                                      ]
                                    ),
                                    child: Text(
                                      "Simpan data",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'Medium',
                                        color: AppColors.white
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },)
    );
  }
  void showcalendar() {
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
                selectedDate: controller.selectedDatee.value,
                holidays: LocalDB.holiday!,
                onDateSelected: (date) {
                  controller.date.value = DateFormat('dd/MM/yyyy').format(date);
                  controller.selectedDatee.value = date;
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
