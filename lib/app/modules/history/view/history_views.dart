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
                  Icon(
                    IconsaxPlusBold.filter,
                    size: 24.sp,
                    color: AppColors.black
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                controller.monthnow.value,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.black7
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Riwayat Absensi",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: 'Medium',
                  color: AppColors.black7
                ),
              ),
            ),
            Column(
              children: List.generate(2, (index) {
                final title = ['Absen Masuk', 'Absen Pulang'];
                final subtitle = ['09:44:33', '10:14:33'];
                final subtitle2 = [(DateFormat('EEEE, d MMMM yyyy', 'id').format(DateTime.now())), (DateFormat('EEEE, d MMMM yyyy', 'id').format(DateTime.now()))];
                final status = ['Terlambat', 'Pulang Duluan'];
                return builditemhistory(
                  index: index, itemCount: 2, 
                  title: title[index], 
                  subtitle: subtitle[index], 
                  subtitle2: subtitle2[index],
                  status: status[index]
                );
              },),
            )
          ],
        ),
      ),
    );
  }

  Widget builditemhistory({
    required int index, 
    required int itemCount, 
    required String title, 
    required String subtitle, 
    required String subtitle2,
    required String status
  }) {
    final lastindex = index == itemCount - 1;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: lastindex ? null : Border(bottom: BorderSide(color: AppColors.grey18)),
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
}
