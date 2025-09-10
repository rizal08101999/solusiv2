// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:solusi/core/helper.dart';

import '../../core/colors.dart';

class CustomCalendar extends StatefulWidget { // bulan yang sedang ditampilkan
  final DateTime selectedDate; // tanggal yang dipilih
  final List<HolidayEntity> holidays; // daftar tanggal merah
  final ValueChanged<DateTime> onDateSelected; // event pilih tanggal
  final String page;

  const CustomCalendar({
    super.key,
    required this.selectedDate,
    required this.holidays,
    required this.onDateSelected,
    required this.page,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final Rx<DateTime> currentMonth = DateTime.now().obs;
  
  @override
  void initState() {
    super.initState();
    if (widget.selectedDate != currentMonth.value) {
      currentMonth.value = DateTime(widget.selectedDate.year, widget.selectedDate.month, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      
      debugPrint((widget.selectedDate != currentMonth.value).toString());
      debugPrint(currentMonth.value.toString());
      int daysInMonth = DateTime(currentMonth.value.year, currentMonth.value.month + 1, 0).day;
      DateTime firstDayOfMonth = DateTime(currentMonth.value.year, currentMonth.value.month, 1);
      int weekdayOfFirstDay = firstDayOfMonth.weekday;
      DateTime lastDayOfPreviousMonth = firstDayOfMonth.subtract(const Duration(days: 1));
      int daysInPreviousMonth = lastDayOfPreviousMonth.day;

      const weekdays = ["S", "S", "R", "K", "J", "S", "M"];
      int totalCells = 42;
      return Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 15, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          AppColors.gradientnavbar,
                          AppColors.gradientnavbar2
                        ], // Ganti dengan gradient kamu
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      blendMode: BlendMode.srcIn,
                      child: Icon(
                        IconsaxPlusLinear.calendar,
                        size: 24,
                        color: Colors.white, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
                      ),
                    ),
                    Text(
                      "Calendar",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      "${_monthName(currentMonth.value.month)} ${currentMonth.value.year}",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            debugPrint("test");
                            currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month - 1, 1);
                          },
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                AppColors.gradientnavbar,
                                AppColors.gradientnavbar2
                              ], // Ganti dengan gradient kamu
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            blendMode: BlendMode.srcIn,
                            child: Icon(
                              IconsaxPlusLinear.arrow_left_1,
                              size: 20,
                              color: Colors.white, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month + 1, 1);
                          },
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [
                                AppColors.gradientnavbar,
                                AppColors.gradientnavbar2
                              ], // Ganti dengan gradient kamu
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            blendMode: BlendMode.srcIn,
                            child: Icon(
                              IconsaxPlusLinear.arrow_right_3,
                              size: 20,
                              color: Colors.white, // harus ada, tapi warnanya akan ditimpa oleh ShaderMask
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Hari
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: weekdays
                  .asMap()
                  .entries
                  .map(
                    (entry) => Expanded(
                      child: Center(
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: entry.key == 6 ? AppColors.red : AppColors.black2,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),

          const SizedBox(height: 5),

          // Grid tanggal
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1.2,
              ),
              itemCount: totalCells,
              itemBuilder: (context, index) {
                DateTime date;
                if (index < weekdayOfFirstDay - 1) {
                  int prevMonthDay = daysInPreviousMonth - (weekdayOfFirstDay - index) + 2;
                  date = DateTime(currentMonth.value.year, currentMonth.value.month - 1, prevMonthDay);
                } else if (index >= daysInMonth + weekdayOfFirstDay - 1) {
                  int nextMonthDay = index - (daysInMonth + weekdayOfFirstDay - 2);
                  date = DateTime(currentMonth.value.year, currentMonth.value.month + 1, nextMonthDay);
                } else {
                  date = DateTime(currentMonth.value.year, currentMonth.value.month, index - weekdayOfFirstDay + 2);
                }

                bool isSelected = date.year == widget.selectedDate.year &&
                    date.month == widget.selectedDate.month &&
                    date.day == widget.selectedDate.day;

                bool isHoliday = widget.holidays.any((holiday) => DateFormat('yyyy-MM-dd').parse(holiday.holidayDate) == date && holiday.isNationalHoliday == true);
                return GestureDetector(
                  onTap: () => widget.onDateSelected(date),
                  child: _buildDayCell(
                    day: date.day,
                    isCurrentMonth: date.month == currentMonth.value.month,
                    isSunday: date.weekday == DateTime.sunday,
                    isHoliday: isHoliday,
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          ),
        ],
      );
    },);
  }

  Widget _buildDayCell({
    required int day,
    required bool isCurrentMonth,
    required bool isSunday,
    required bool isHoliday,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.black2 : AppColors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$day",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isHoliday && isCurrentMonth
                ? AppColors.red
                : isCurrentMonth
                    ? (isSunday ? AppColors.red : isSelected ? AppColors.white : AppColors.black)
                    : isSelected ? AppColors.white : AppColors.black.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Augustus', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}
