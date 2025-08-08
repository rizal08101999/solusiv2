import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/menus/view/menus_views.dart';

class DashboardController extends GetxController {
  RxInt currentNavbarIndex = 0.obs;
  final argNavbarIndex = 0.obs;
  

  void selectIndex(int index) {
    final context = Get.context!;
    if (index != 1) {
      currentNavbarIndex.value = index; 
    } else {
      showModalBottomSheet(
        context: context, 
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return MenusViews();
        },
      );
    }
  }
}