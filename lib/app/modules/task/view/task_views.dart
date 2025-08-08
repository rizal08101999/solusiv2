import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';

class TaskViews extends GetView<TaskController> {
  const TaskViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task')),
      body: const Center(child: Text('Welcome to Task Page')),
    );
  }
}
