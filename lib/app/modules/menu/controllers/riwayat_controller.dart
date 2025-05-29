// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class RiwayatController extends GetxController {
  final DateTime currentDate = DateTime.now();
  late AutoScrollController controller;
  late int initialIndex;
  late List<bool> isSelectedList;
  final loading = false.obs;

  @override
  void onInit() {
    isSelectedList = List.generate(
      DateTime(currentDate.year, currentDate.month + 1, 0).day,
      (index) => false,
    );
    initialiaze();
    super.onInit();
  }

  void initialiaze() {
    initialIndex = currentDate.day - 1;
    
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(10.sp, 0.sp, 10.sp, 0.sp),
      axis: Axis.horizontal,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToIndex(initialIndex);
    });
    print(isSelectedList);
  }
  

   void scrollToIndex(int index) {
    controller.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
  }
  String getDayOfWeek(int weekday) {
    const List<String> weekdays = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ];
    return weekdays[weekday - 1];
  }
}