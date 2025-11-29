// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:solusi/app/widgets/pop_up_load.dart';
import '../model/history_model.dart';

import '../../../repositorys/scheduleabsence_repository.dart';

class HistoryController extends GetxController {
  final today = DateTime.now();
  final activeDate = DateTime.now().obs;
  final listhistory = <HistoryModel>[].obs;
  final monthnow = "".obs;
  final showFilterForm = false.obs;
  final loading = false.obs;
  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final scheduleabsencerepo = ScheduleAbsenceRepository();

  late List<DateTime> datesInMonth;
  ScrollController? scrollController;

  final double itemWidth = 60.0;

  @override
  void onInit() {
    super.onInit();
    datesInMonth = _generateDatesInMonth(today);
    Future.delayed(Duration.zero, () {
      initialiaze();
    });
  }

  void initialiaze() async {
    loading.value = true;
    Get.dialog(PopUpLoad());
    scrollController = ScrollController();
    datesInMonth = _generateDatesInMonth(today);
    monthnow.value = DateFormat('MMMM yyyy', 'id').format(today);
    
    // Auto fetch current month data
    final firstDayOfMonth = DateTime(today.year, today.month, 1);
    final lastDayOfMonth = DateTime(today.year, today.month + 1, 0);
    await fetchFilteredHistoryData(firstDayOfMonth, lastDayOfMonth);
    
    Get.back();
    loading.value = false;
    
    // Scroll to today's date after everything is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToCenter(today);
    });
    
    print("done");
  }


  @override
  void onReady() {
    super.onReady();
    // Scroll to active date when the view is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    if (scrollController == null || !scrollController!.hasClients) return;
    
    final index = datesInMonth.indexWhere(
      (d) => d.day == date.day && d.month == date.month && d.year == date.year,
    );

    if (index == -1) return;

    final screenWidth = Get.width;
    final listViewPadding = 30.0;
    final availableWidth = screenWidth - listViewPadding;
    final itemTotalWidth = itemWidth + 12;
    
    final targetOffset = (index * itemTotalWidth) - (availableWidth / 2) + (itemTotalWidth / 2);
    final maxOffset = (datesInMonth.length * itemTotalWidth) - availableWidth;

    scrollController!.animateTo(
      max(0, min(targetOffset, maxOffset)),
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

  void toggleFilterForm() {
    showFilterForm.value = !showFilterForm.value;
  }

  void applyDateRangeFilter() async {
    if (startDate.value != null && endDate.value != null) {
      Get.dialog(PopUpLoad());
      
      // Fetch filtered data from API
      await fetchFilteredHistoryData(startDate.value!, endDate.value!);
      
      datesInMonth = _generateDateRange(startDate.value!, endDate.value!);
      
      // Update month display based on date range
      if (startDate.value!.month == endDate.value!.month && 
          startDate.value!.year == endDate.value!.year) {
        monthnow.value = DateFormat('MMMM yyyy', 'id').format(startDate.value!);
      } else {
        monthnow.value = '${DateFormat('MMM yyyy', 'id').format(startDate.value!)} - ${DateFormat('MMM yyyy', 'id').format(endDate.value!)}';
      }
      
      activeDate.value = startDate.value!;
      showFilterForm.value = false;
      Get.back();
      
      // Scroll to the start date
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToCenter(startDate.value!);
      });
    }
  }

  Future<void> fetchFilteredHistoryData(DateTime start, DateTime end) async {
    try {
      final response = await scheduleabsencerepo.getHistoryAbsensiByRange(
        DateFormat('yyyy-MM-dd').format(start),
        DateFormat('yyyy-MM-dd').format(end)
      );
      if (response.isNotEmpty) {
        listhistory.assignAll(response);
        print(listhistory.length);
      }
    } catch (e) {
      print('Error fetching filtered history: $e');
    }
  }

  List<DateTime> _generateDateRange(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    DateTime current = start;
    
    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      dates.add(current);
      current = current.add(Duration(days: 1));
    }
    
    return dates;
  }

  void resetFilter() async {
    Get.dialog(PopUpLoad());
    
    startDate.value = null;
    endDate.value = null;
    datesInMonth = _generateDatesInMonth(today);
    monthnow.value = DateFormat('MMMM yyyy', 'id').format(today);
    activeDate.value = today;
    showFilterForm.value = false;
    
    // Fetch current month data
    final firstDayOfMonth = DateTime(today.year, today.month, 1);
    final lastDayOfMonth = DateTime(today.year, today.month + 1, 0);
    await fetchFilteredHistoryData(firstDayOfMonth, lastDayOfMonth);
    
    Get.back();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToCenter(today);
    });
  }

  List<HistoryModel> getHistoryForActiveDate() {
    final activeDateStr = DateFormat('dd-MM-yyyy').format(activeDate.value);
    return listhistory.where((item) => item.date == activeDateStr).toList();
  }

  bool hasDataForDate(DateTime date) {
    final dateStr = DateFormat('dd-MM-yyyy').format(date);
    return listhistory.any((item) => item.date == dateStr);
  }

}
