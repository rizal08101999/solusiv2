import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:solusi/app/modules/home/model/home_model.dart';
import 'package:solusi/app/repositorys/home_repositorys.dart';
import 'package:solusi/core/local_db.dart';

class HomeController extends GetxController {
  final loading = false.obs;
  final homerepo = HomeRepositorys();
  final absensi = RxList<DashboardEntity>();
  final resume = RxList<DashboardEntity>();
  final name = "".obs;
  final company = "".obs;
  final datenow = "".obs;
  final monthnow = "".obs;

  @override
  void onInit() {
    initialiaze();
    super.onInit();
  }

  void initialiaze() async {
    loading.value = true;
    datenow.value = DateFormat('dd MMMM yyyy', 'id').format(DateTime.now());
    monthnow.value = DateFormat('MMMM yyyy', 'id').format(DateTime.now());
    final data = await homerepo.getresume();
    name.value = LocalDB.user!.activeEmployee.nameEmployee;
    company.value = LocalDB.user!.activeEmployee.nameCompany;
    if (data.isNotEmpty) {
      // Hilangkan duplikat berdasarkan label
      final Map<String, DashboardEntity> uniqueMap = {
        for (var item in data) item.label: item,
      };
      final uniqueList = uniqueMap.values.toList();

      // Pisahkan berdasarkan label mengandung "absen"
      final filteredabsensi = uniqueList
          .where((item) => item.label.toLowerCase().contains('absen'))
          .toList();

      final filteredresume = uniqueList
          .where((item) => !item.label.toLowerCase().contains('absen'))
          .toList();
      absensi.assignAll(filteredabsensi);
      resume.assignAll(filteredresume);
      debugPrint(absensi.toString());
      debugPrint(resume.toString());
      loading.value = false;
    } else {
      debugPrint("gagal mendapatkan data");
      loading.value = false;
    }
  }

  void refreshdata() async {
    final data = await homerepo.getresume();
    name.value = LocalDB.user!.activeEmployee.nameEmployee;
    company.value = LocalDB.user!.activeEmployee.nameCompany;
    if (data.isNotEmpty) {
      // Hilangkan duplikat berdasarkan label
      final Map<String, DashboardEntity> uniqueMap = {
        for (var item in data) item.label: item,
      };
      final uniqueList = uniqueMap.values.toList();

      // Pisahkan berdasarkan label mengandung "absen"
      final filteredabsensi = uniqueList
          .where((item) => item.label.toLowerCase().contains('absen'))
          .toList();

      final filteredresume = uniqueList
          .where((item) => !item.label.toLowerCase().contains('absen'))
          .toList();
      absensi.assignAll(filteredabsensi);
      resume.assignAll(filteredresume);
    } else {
      debugPrint("gagal mendapatkan data");
    }
  }

}