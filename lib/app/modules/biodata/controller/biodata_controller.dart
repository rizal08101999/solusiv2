import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BiodataController extends GetxController {
  final currentindex = 0.obs;
  final scrollfilterC = ScrollController();

  void selectIndex(int index) {
    currentindex.value = index;
    scrollToSelectedFilter(index);
  }

  void scrollToSelectedFilter(int index) {
    final context = Get.context!;
    double screenWidth = MediaQuery.of(context).size.width;
    double targetPosition = index * 150.0; // Sesuaikan ukuran item filter jika berbeda
    scrollfilterC.animateTo(
      index == 0 ? 0 : targetPosition - screenWidth / 2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
