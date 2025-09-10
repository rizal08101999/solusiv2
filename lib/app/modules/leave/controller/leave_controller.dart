import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveController extends GetxController {
  final isOpendial = false.obs;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
}
