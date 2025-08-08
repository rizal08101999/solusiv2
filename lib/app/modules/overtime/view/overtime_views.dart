import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/overtime_controller.dart';

class OvertimeViews extends GetView<OvertimeController> {
  const OvertimeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overtime')),
      body: const Center(child: Text('Welcome to Overtime Page')),
    );
  }
}
