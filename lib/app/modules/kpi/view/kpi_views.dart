import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import '../../../../core/colors.dart';
import '../../../widgets/formfield.dart';
import '../../../widgets/year_picker_dialog.dart';
import '../controller/kpi_controller.dart';

class KpiViews extends GetView<KpiController> {
  const KpiViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg_pegawai2.png'),
              fit: BoxFit.fill),
        ),
        child: Obx(() {
          return Column(
            children: [
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
                      "Data KPI",
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
              SizedBox(height: 35,),
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
                  child: FadeIn(
                    duration: Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        spacing: 15,
                        children: [
                          FieldForm(
                            label: "Cari tahun kpi",
                            onTap: () {
                              showcalendar("date");
                            },
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 10,
                                  children: [
                                    Icon(
                                      IconsaxPlusLinear.calendar_search,
                                      size: 20.sp,
                                      color: AppColors.black9,
                                    ),
                                    Text(
                                      controller.date.isNotEmpty ? controller.date.value : "Pilih Tanggal",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'Medium',
                                        color: AppColors.grey11
                                      )
                                    ),
                                  ],
                                ),
                                Icon(
                                  IconsaxPlusLinear.search_normal,
                                  size: 20.sp,
                                  color: AppColors.black9,
                                ),
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
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                spacing: 10,
                                children: List.generate(3, (index) => builditemsalary()).toList(),
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
          );
        },)
      ),
    );
  }

  Widget builditemsalary() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
                    colors: [
                      ColorsGradiet.orange2,
                      ColorsGradiet.orange1,
                    ],
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
                          Row(
                            spacing: 10,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    ColorsGradiet.orange1,
                                    ColorsGradiet.orange2,
                                  ], // Ganti dengan gradient kamu
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds),
                                blendMode: BlendMode.srcIn,
                                child: Icon(
                                  IconsaxPlusBold.cup,
                                  size: 24,
                                  color: Colors.white, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
                                ),
                              ),
                              ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    ColorsGradiet.orange1,
                                    ColorsGradiet.orange2,
                                  ], // Ganti dengan gradient kamu
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds),
                                blendMode: BlendMode.srcIn,
                                child: Text(
                                  "Desember 2024",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'SemiBold',
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                ColorsGradiet.orange2,
                                ColorsGradiet.orange1,
                              ], // Ganti dengan gradient kamu
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ).createShader(bounds),
                            blendMode: BlendMode.srcIn,
                            child: Icon(
                              IconsaxPlusLinear.arrow_right,
                              size: 24,
                              color: Colors.white, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
                            ),
                          ),
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
                          buildrowitem(title: "AVERAGE", value: "4.45"),
                          buildrowitem(title: "Status", value: "BAIK"),
                          buildrowitem(title: "Keterangan", value: "nice job kids"),
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
                                "Atasan Langsung",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.grey19
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Achmad Badawi",
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
    );
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

  void showcalendar(String args) {
    // Extract the current year from the selected date or use current year
    final currentYear = controller.selectedDatee.value.year;
    
    Get.dialog(
      YearPickerDialog(
        selectedYear: currentYear,
        onYearSelected: (year) {
          // Format the selected year as a string
          controller.date.value = year.toString();
          debugPrint("Selected Year: ${controller.date.value}");
          // Update the selected date to the first day of the selected year
          controller.selectedDatee.value = DateTime(year, 1, 1);
        },
      ),
    );
  }
}
