import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solusi/app/data/entities/absen.dart';
import 'package:solusi/app/widgets/pop_up_load.dart';
import 'package:solusi/core/colors.dart';

class HomeController extends GetxController {
  final listabsensi = RxList<AbsensiEntity>();
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, initialiaze);
  }

  void initialiaze() async {
    loading.value = true;
    Get.dialog(
      barrierDismissible: false,
      PopUpLoad(children: [
        Column(
          children: [
            CircularProgressIndicator(
              color: DataColors.grey,
              strokeWidth: 4,
            ),
          ],
        )
      ])
    );
    final listabsen = [
      AbsensiEntity(
        id: "1", 
        label: "Absen Masuk", 
        date: "2024-01-23", 
        timeIn: "13:30:02", 
        timeOut: "", 
        status: "Terlambat"
      ),
      AbsensiEntity(
        id: "2", 
        label: "Absen Keluar", 
        date: "2024-01-23", 
        timeIn: "13:30:02", 
        timeOut: "16:50:00", 
        status: "Pulang Duluan"
      ),
      AbsensiEntity(
        id: "3", 
        label: "Absen Masuk", 
        date: "2024-01-24", 
        timeIn: "07:00:00", 
        timeOut: "", 
        status: ""
      ),
      AbsensiEntity(
        id: "4", 
        label: "Absen Keluar", 
        date: "2024-01-24", 
        timeIn: "07:00:00", 
        timeOut: "17:00:00", 
        status: ""
      ),
    ];
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      listabsensi.assignAll(listabsen);
      Get.back();
      loading.value = false;
    },);
  }
}