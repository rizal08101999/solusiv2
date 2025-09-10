import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddControllers extends GetxController {
  final nameovertimeC = TextEditingController();
  final infoovertimeC = TextEditingController();
  final isshowrequiredname = false.obs;
  final isshowrequiredinfo = false.obs;
  final isshowrequireddate = false.obs;
  final isshowrequiredhoursin = false.obs;
  final isshowrequiredhoursout = false.obs;
  final isnotemptyname = false.obs;
  final isnotemptyinfo = false.obs;
  final isnotemptydate = false.obs;
  final isnotemptyhoursin = false.obs;
  final isnotemptyhoursout = false.obs;
  final name = ''.obs;
  final info = ''.obs;
  final date = "".obs;
  final hoursin = "".obs;
  final hoursout = "".obs;
  var selectedDatee = Rx<DateTime>(DateTime.now());

}