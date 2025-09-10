import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddleaveControllers extends GetxController {
  final infoC = TextEditingController();
  final isnotemptyemployechange = false.obs;
  final startdate = "".obs;
  final enddate =  "".obs;
  final isnotemptystartdate = false.obs;
  final isnotemptyenddate = false.obs;
  final isnotemptyinfo = false.obs;
  final isnotemptyhours = false.obs;
  final isshowrequiredstartdate = false.obs;
  final isshowrequiredenddate = false.obs;
  final isshowrequiredinfo = false.obs;
  final isshowrequiredhours = false.obs;
  final startdatee = Rx<DateTime>(DateTime.now());
  final enddatee = Rx<DateTime>(DateTime.now());
  final hours = "".obs;
  

}