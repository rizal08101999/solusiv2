import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/infoaccount_controller.dart';

class InfoaccountViews extends GetView<InfoaccountController> {
  const InfoaccountViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infoaccount')),
      body: const Center(child: Text('Welcome to Infoaccount Page')),
    );
  }
}
