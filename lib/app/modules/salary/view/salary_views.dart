import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/salary_controller.dart';

class SalaryViews extends GetView<SalaryController> {
  const SalaryViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salary')),
      body: const Center(child: Text('Welcome to Salary Page')),
    );
  }
}
