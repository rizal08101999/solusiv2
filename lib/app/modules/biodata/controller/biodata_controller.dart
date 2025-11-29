import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solusi/app/modules/biodata/model/biodata_model.dart';
import 'package:solusi/app/repositorys/staffing_repository.dart';

import '../../../widgets/pop_up_load.dart';

class BiodataController extends GetxController {
  final currentindex = 0.obs;
  final scrollfilterC = ScrollController();
  final personalData = <PersonalDataEntity>[].obs;
  final educationData = <PersonalDataEntity>[].obs;
  final staffingData = <PersonalDataEntity>[].obs;
  final familyData = <PersonalDataEntity>[].obs;
  final insuranceData = <PersonalDataEntity>[].obs;
  final bankData = <PersonalDataEntity>[].obs;
  final loading = false.obs;
  final staffingRepo = StaffingRepository();

  

  void selectIndex(int index) {
    currentindex.value = index;
    scrollToSelectedFilter(index);
    _loadDataByIndex(index);
  }

  void _loadDataByIndex(int index) {
    switch (index) {
      case 0:
        if (personalData.isEmpty) getPersonalData();
        break;
      case 1:
        if (educationData.isEmpty) getEducationData();
        break;
      case 2:
        if (staffingData.isEmpty) getStaffingData();
        break;
      case 3:
        if (familyData.isEmpty) getFamilyData();
        break;
      case 4:
        if (insuranceData.isEmpty) getInsuranceData();
        break;
      case 5:
        if (bankData.isEmpty) getBankData();
        break;
    }
  }

  void scrollToSelectedFilter(int index) {
    final context = Get.context!;
    double screenWidth = MediaQuery.of(context).size.width;
    double targetPosition = index * 150.0;
    scrollfilterC.animateTo(
      index == 0 ? 0 : targetPosition - screenWidth / 2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<void> getPersonalData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getPersonalData();
      personalData.assignAll(data);
    } catch (e) {
      personalData.clear();
    } finally {
      Get.back();
    }
  }

  String getDataByTitle(String title) {
    final item = personalData.firstWhere(
      (element) => element.title.toLowerCase() == title.toLowerCase(),
      orElse: () => PersonalDataEntity(title: '', data: '-'),
    );
    return item.data is String ? item.data : '';
  }

  Future<void> getEducationData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getEducationData();
      educationData.assignAll(data);
    } catch (e) {
      educationData.clear();
    } finally {
      Get.back();
    }
  }

  Future<void> getStaffingData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getStaffingData();
      staffingData.assignAll(data);
    } catch (e) {
      staffingData.clear();
    } finally {
      Get.back();
    }
  }

  Future<void> getFamilyData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getFamilyData();
      familyData.assignAll(data);
    } catch (e) {
      familyData.clear();
    } finally {
      Get.back();
    }
  }

  Future<void> getInsuranceData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getInsuranceData();
      insuranceData.assignAll(data);
    } catch (e) {
      insuranceData.clear();
    } finally {
      Get.back();
    }
  }

  Future<void> getBankData() async {
    Get.dialog(PopUpLoad());
    try {
      final data = await staffingRepo.getBankData();
      bankData.assignAll(data);
    } catch (e) {
      bankData.clear();
    } finally {
      Get.back();
    }
  }

  String getEducationDataByTitle(String title) {
    final item = educationData.firstWhere(
      (element) => element.title.toLowerCase() == title.toLowerCase(),
      orElse: () => PersonalDataEntity(title: '', data: ''),
    );
    if (item.data == null || item.data == '') return '';
    return item.data is String ? item.data : 'belum ada data';
  }

  String getStaffingDataByTitle(String title) {
    final item = staffingData.firstWhere(
      (element) => element.title.toLowerCase() == title.toLowerCase(),
      orElse: () => PersonalDataEntity(title: '', data: ''),
    );
    if (item.data == null || item.data == '') return '';
    return item.data is String ? item.data : 'belum ada data';
  }

  dynamic getFamilyDataByTitle(String title) {
    final item = familyData.firstWhere(
      (element) => element.title.toLowerCase() == title.toLowerCase(),
      orElse: () => PersonalDataEntity(title: '', data: ''),
    );
    if (item.data == null || item.data == '') return '';
    return item.data;
  }

  String getInsuranceDataByTitle(String title) {
    final item = insuranceData.firstWhere(
      (element) => element.title.toLowerCase() == title.toLowerCase(),
      orElse: () => PersonalDataEntity(title: '', data: ''),
    );
    if (item.data == null || item.data == '') return '';
    return item.data is String ? item.data : 'belum ada data';
  }

  String getBankDataByTitle(String title) {
    final item = bankData.firstWhere(
      (element) => element.title.toLowerCase() == title.toLowerCase(),
      orElse: () => PersonalDataEntity(title: '', data: ''),
    );
    if (item.data == null || item.data == '') return '';
    return item.data is String ? item.data : 'belum ada data';
  }
}
