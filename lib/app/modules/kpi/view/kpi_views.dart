import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/kpi_controller.dart';

class KpiViews extends GetView<KpiController> {
  const KpiViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kpi')),
      body: const Center(child: Text('Welcome to Kpi Page')),
    );
  }
}
