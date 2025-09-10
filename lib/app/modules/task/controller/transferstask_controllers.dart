import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferstaskControllers extends GetxController {
  final titleC = TextEditingController();
  final noteC = TextEditingController();
  final notetaskC = TextEditingController();
  final linkC = TextEditingController();
  final date = "".obs;
  final deadline = "".obs;
  final assignor = "".obs;
  final type = "".obs;
  final file = Rxn<File>();
  final isnotemptytitle = false.obs;
  final isnotemptynote = false.obs;
  final isnotemptynotetask = false.obs;
  final isnotemptylink = false.obs;
  final isnotemptydate = false.obs;
  final isnotemptydeadline = false.obs;
  final isnotemptyassignor = false.obs;
  final isnotemptytype = false.obs;
  final isshowrequiredtitle = false.obs;
  final isshowrequirednote = false.obs;
  final isshowrequirednotetask = false.obs;
  final isshowrequiredlink = false.obs;
  final isshowrequireddate = false.obs;
  final isshowrequireddeadline = false.obs;
  final datee = Rx<DateTime>(DateTime.now());
  final deadlinee = Rx<DateTime>(DateTime.now());

}