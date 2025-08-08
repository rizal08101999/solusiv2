import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/leave_controller.dart';

class LeaveViews extends GetView<LeaveController> {
  const LeaveViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leave')),
      body: const Center(child: Text('Welcome to Leave Page')),
    );
  }
}
