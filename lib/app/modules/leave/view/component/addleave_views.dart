// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:solusi/app/widgets/custom_dropdown.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/local_db.dart';
import '../../../../widgets/custom_timepicker.dart';
import '../../../../widgets/customcalendar.dart';
import '../../../../widgets/formfield.dart';
import '../../../../widgets/pop_up_load.dart';
import '../../controller/addleave_controllers.dart';

class AddLeaveViews extends GetView<AddleaveControllers> {
  const AddLeaveViews({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
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
            "Simpan data",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'SemiBold',
              color: AppColors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 5),
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
                      color: AppColors.black2,
                      size: 24.sp,
                    ),
                  ),
                ),
                Text(
                  args,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'SemiBold',
                    color: AppColors.black2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15,
                    children: [
                      buildviewsemployee(args),
                      buildviewsinfo(args: args),
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget buildviewsemployee(String args) {
    return Container(
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
          if(args != "Izin Cuti Bulanan") 
          Text(
            "Pegawai",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'SemiBold',
              color: AppColors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      IconsaxPlusBold.profile,
                      size: 20,
                      color: AppColors.grey11,
                    ),
                    Text(
                      "Nama",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'SemiBold',
                        color: AppColors.grey11,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 50,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.grey10),
                    color: AppColors.bg2
                  ),
                  child: Text(
                    "A.Badawi",
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
          if(args == "Izin Cuti Bulanan")
          CustomDropdownField(
            hintText: "Pilih Pegawai", 
            isnotemptyfield: controller.isnotemptyemployechange, 
            label: "", 
            items: ['Budi', 'Jiji', 'Gunawan'], 
            widgetcustom: Row(
              spacing: 8,
              children: [
                Icon(
                  IconsaxPlusBold.profile,
                  size: 20,
                  color: AppColors.grey11,
                ),
                Text(
                  "Pegawai Pengganti",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'SemiBold',
                    color: AppColors.grey11,
                  ),
                )
              ],
            ),
            onTap: (p0) {
              
            },
          ),
          SizedBox(height: args != "Izin Cuti Bulanan" ? 5 : 15,)
        ],
      ),
    );
  }

  Widget buildviewsinfo({
    required String args
  }) {
    return Obx(() {
      return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            if(args != "Izin Cuti Bulanan")
            Text(
              args.contains("Terlambat") ? "Keterangan Keterlambatan" : args.contains("Tidak Masuk") ? "Keterangan Tidak Masuk" : "Keterangan Izin",
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'SemiBold',
                color: AppColors.black,
              ),
            ),
            FieldForm(
              label: "Tanggal Mulai",
              onTap: () {
                showcalendar("start");
              },
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.startdate.isNotEmpty ? controller.startdate.value : "Pilih Tanggal",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'Medium',
                      color: controller.startdate.isNotEmpty ? AppColors.black : AppColors.grey11
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
              isnotemptyfield: controller.isnotemptystartdate, 
              isshowrequiredfield: controller.isshowrequiredstartdate
            ),
            FieldForm(
              label: "Sampai",
              onTap: () {
                showcalendar("end");
              },
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.enddate.isNotEmpty ? controller.enddate.value : "Pilih Tanggal",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'Medium',
                      color: controller.enddate.isNotEmpty ? AppColors.black : AppColors.grey11
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
              isnotemptyfield: controller.isnotemptyenddate, 
              isshowrequiredfield: controller.isshowrequiredenddate
            ),
            if(args.contains("Terlambat") || args.contains("Pulang"))
            FieldForm(
              label: args.contains("Terlambat") ? "Waktu Terlambat" : "Waktu Pulang",
              onTap: () {
                final context = Get.context!;
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  builder: (context) {
                    return CustomTimePicker(
                      initialTime: TimeOfDay.now(),
                      onTimeSelected: (time) {
                        controller.hours.value = time.format(context);
                      },
                    );
                  },
                );
              },
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.hours.isNotEmpty ? controller.hours.value : args.contains("Terlambat") ? "Isi Jam Terlambat" : "Isi Jam Pulang Duluan",
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
              isnotemptyfield: controller.isnotemptyhours, 
              isshowrequiredfield: controller.isshowrequiredhours
            ),
            FieldForm(
              label: args.contains("Cuti") ? "Keterangan Cuti" : args.contains("Tidak Masuk") ? "Keterangan Tidak Masuk" : "Keterangan", 
              controller: controller.infoC, 
              hintText: "${args.contains("Cuti") ? "Keterangan" : args.contains("Tidak Masuk") ? "Keterangan Tidak Masuk" : "Keterangan"}...", 
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Upload File",
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
                        "Tidak ada file yang dipilih",
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
            )
          ],
        ),
      );
    },);
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
                selectedDate: type == "start" ? controller.startdatee.value : controller.enddatee.value,
                holidays: LocalDB.holiday!,
                onDateSelected: (date) {
                  if (type == "start") {
                    controller.startdate.value = DateFormat('dd/MM/yyyy').format(date);
                    controller.startdatee.value = date;
                  } else {
                    controller.enddate.value = DateFormat('dd/MM/yyyy').format(date);
                    controller.enddatee.value = date;
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
