import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:solusi/core/colors.dart';
import '../controller/history_controller.dart';

class HistoryViews extends GetView<HistoryController> {
  const HistoryViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    child: Icon(
                      IconsaxPlusLinear.arrow_left_1,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  Text(
                    "Riwayat Absensi",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black2
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.toggleFilterForm(),
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    child: Icon(
                      IconsaxPlusBold.filter,
                      size: 24.sp,
                      color: AppColors.black
                    ),
                  )
                ],
              ),
            ),
            Obx(() => AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, -0.3),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  )),
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: controller.showFilterForm.value 
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: buildFilterForm(),
                )
                : SizedBox.shrink(),
            )),
            Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 3000),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                0, 
                controller.showFilterForm.value ? 0 : 0, 
                0
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        controller.monthnow.value,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.black7
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 90,
                        child: Obx(() {
                          final activeDate = controller.activeDate.value;
                          return ListView.builder(
                            controller: controller.scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.datesInMonth.length,
                            itemBuilder: (context, index) {
                              final date = controller.datesInMonth[index];
                              final isActive = date.day == activeDate.day &&
                                  date.month == activeDate.month &&
                                  date.year == activeDate.year;
                              
                              return GestureDetector(
                                onTap: () => controller.setActiveDate(date),
                                child: Container(
                                  width: controller.itemWidth,
                                  margin: const EdgeInsets.symmetric(horizontal: 6),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: isActive ? AppColors.grey16 : AppColors.white,
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(color: AppColors.grey6),
                                  ),
                                  child: Column(
                                    spacing: 3,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.getDayInitial(date),
                                        style: isActive ?
                                        TextStyle(
                                          color: AppColors.black,
                                          fontSize: 14
                                        ) :
                                        TextStyle(
                                          color: AppColors.grey17,
                                          fontSize: 14
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${date.day}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'SemiBold',
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "Riwayat Absensi",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'Medium',
                          color: AppColors.black7
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Obx(() {
                        final historyData = controller.getHistoryForActiveDate();
                        if (historyData.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Center(
                              child: Text(
                                "Tidak ada data absensi",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.grey17
                                ),
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: historyData.expand<Widget>((item) {
                            return item.dataAbsensi.map<Widget>((absensi) {
                              return builditemhistory(
                                title: absensi.labelType,
                                subtitle: absensi.time,
                                subtitle2: DateFormat('EEEE, d MMMM yyyy', 'id').format(DateFormat('dd-MM-yyyy').parse(item.date)),
                                status: absensi.labelType == 'Absen Masuk' 
                                  ? (absensi.textLateIn == '-' || absensi.textLateIn == null ? 'Tepat Waktu' : absensi.textLateIn!)
                                  : (absensi.textLateOut == '-' || absensi.textLateOut == null ? 'Tepat Waktu' : absensi.textLateOut!),
                                isLast: false
                              );
                            });
                          }).toList(),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget builditemhistory({
    required String title, 
    required String subtitle, 
    required String subtitle2,
    required String status,
    required bool isLast
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: AppColors.grey18)),
        color: Colors.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    AppColors.gradientnavbar,
                    AppColors.gradientnavbar2
                  ], // Ganti dengan gradient kamu
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(bounds),
                blendMode: BlendMode.srcIn,
                child: Icon(
                  title == "Absen Masuk" ? IconsaxPlusBold.login : IconsaxPlusBold.logout,
                  size: 20,
                )
              ),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black8
                    ),
                  ),
                  Text(
                    subtitle2,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.black8
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: status == "Terlambat" || status == "Pulang Duluan" ? ColorsSchedule.red : AppColors.grey6
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Medium',
                color: status == "Terlambat" || status == "Pulang Duluan" ? AppColors.red : AppColors.black
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFilterForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey6),
      ),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filter Rentang Tanggal",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'SemiBold',
              color: AppColors.black
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Mulai",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.black8
                      ),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: Get.context!,
                          initialDate: controller.startDate.value ?? DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) controller.startDate.value = date;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(() => Text(
                          controller.startDate.value != null 
                            ? DateFormat('dd/MM/yyyy').format(controller.startDate.value!)
                            : 'Pilih tanggal',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: controller.startDate.value != null ? AppColors.black : AppColors.grey17
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal Akhir",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.black8
                      ),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: Get.context!,
                          initialDate: controller.endDate.value ?? DateTime.now(),
                          firstDate: controller.startDate.value ?? DateTime(2020),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) controller.endDate.value = date;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Obx(() => Text(
                          controller.endDate.value != null 
                            ? DateFormat('dd/MM/yyyy').format(controller.endDate.value!)
                            : 'Pilih tanggal',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: controller.endDate.value != null ? AppColors.black : AppColors.grey17
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => controller.resetFilter(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Medium',
                          color: AppColors.black
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: InkWell(
                  onTap: () => controller.applyDateRangeFilter(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.gradientnavbar2,
                          AppColors.gradientnavbar,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Terapkan",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Medium',
                          color: AppColors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
