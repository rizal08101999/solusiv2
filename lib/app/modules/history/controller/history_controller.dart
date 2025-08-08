import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:math';

import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  final today = DateTime.now();
  final activeDate = DateTime.now().obs;
  final monthnow = "".obs;

  late final List<DateTime> datesInMonth;
  late final ScrollController scrollController;

  final double itemWidth = 60.0;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    datesInMonth = _generateDatesInMonth(today);
    monthnow.value = DateFormat('MMMM yyyy', 'id').format(today);
    // Scroll to active date when the view is ready
    Timer(Duration(milliseconds: 300), () {
      scrollToCenter(activeDate.value);
    });
  }

  List<DateTime> _generateDatesInMonth(DateTime referenceDate) {
    // final firstDay = DateTime(referenceDate.year, referenceDate.month, 1);
    final nextMonth = DateTime(referenceDate.year, referenceDate.month + 1, 1);
    final lastDay = nextMonth.subtract(Duration(days: 1));
    return List.generate(
      lastDay.day,
      (index) => DateTime(referenceDate.year, referenceDate.month, index + 1),
    );
  }

  void scrollToCenter(DateTime date) {
    final index = datesInMonth.indexWhere(
      (d) => d.day == date.day && d.month == date.month && d.year == date.year,
    );

    if (index == -1) return;

    final screenWidth = Get.width;
    final targetOffset = index * itemWidth - (screenWidth / 4 - itemWidth / 4);

    scrollController.animateTo(
      max(0, targetOffset),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }


  void setActiveDate(DateTime date) {
    activeDate.value = date;
    scrollToCenter(date);
  }

  String getDayInitial(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'S'; // Senin
      case DateTime.tuesday:
        return 'S'; // Selasa
      case DateTime.wednesday:
        return 'R'; // Rabu
      case DateTime.thursday:
        return 'K'; // Kamis
      case DateTime.friday:
        return 'J'; // Jumat
      case DateTime.saturday:
        return 'S'; // Sabtu
      case DateTime.sunday:
        return 'M'; // Minggu
      default:
        return '';
    }
  }

}
