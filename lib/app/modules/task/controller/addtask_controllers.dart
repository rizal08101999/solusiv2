import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  final date = "".obs;
  final deadline = "".obs;
  final assignor = "".obs;
  final type = "".obs;
  final file = Rxn<File>();
  final isnotemptydate = false.obs;
  final isnotemptydeadline = false.obs;
  final isnotemptyassignor = false.obs;
  final isnotemptytitle = false.obs;
  final isnotemptynote = false.obs;
  final isnotemptylink = false.obs;
  final isnotemptytype = false.obs;
  final isshowrequireddate = false.obs;
  final isshowrequireddeadline = false.obs;
  final isshowrequiredtitle = false.obs;
  final isshowrequirednote = false.obs;
  final isshowrequiredlink = false.obs;
  final titleC = TextEditingController();
  final noteC = TextEditingController();
  final linkC = TextEditingController();
  var selectedDatee = Rx<DateTime>(DateTime.now());
  var selectedDatee2 = Rx<DateTime>(DateTime.now());


  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (pickedFile != null) {
      file.value = File(pickedFile.files.single.path!);
    }
  }

}