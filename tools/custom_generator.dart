// ignore_for_file: avoid_print

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Gunakan: dart tools/custom_generator.dart [--no-model] modul1 modul2 ...');
    return;
  }

  final noModel = args.contains('--no-model');
  final moduleNames = args.where((e) => !e.startsWith('--')).toList();

  for (final name in moduleNames) {
    final path = 'lib/app/modules/$name';
    final controllerPath = '$path/controller';
    final viewPath = '$path/view';

    Directory(controllerPath).createSync(recursive: true);
    Directory(viewPath).createSync(recursive: true);

    File('$controllerPath/${name}_controller.dart').writeAsStringSync('''
import 'package:get/get.dart';

class ${_toPascalCase(name)}Controller extends GetxController {
  
}
''');

    File('$viewPath/${name}_views.dart').writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/${name}_controller.dart';

class ${_toPascalCase(name)}Views extends GetView<${_toPascalCase(name)}Controller> {
  const ${_toPascalCase(name)}Views({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('${_toPascalCase(name)}')),
      body: const Center(child: Text('Welcome to ${_toPascalCase(name)} Page')),
    );
  }
}
''');

    if (!noModel) {
      final modelPath = '$path/model';
      Directory(modelPath).createSync(recursive: true);
      File('$modelPath/${name}_model.dart').writeAsStringSync('''
class ${_toPascalCase(name)}Model {
  // TODO: Model
}
''');
    }
  }
}

String _toPascalCase(String input) {
  return input.split('_').map((e) => e[0].toUpperCase() + e.substring(1)).join();
}
