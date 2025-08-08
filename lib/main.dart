import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/app/routes/app_pages.dart';
import 'package:solusi/core/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(450 * .95, 869 * .95),
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Solusi',
          builder: (context, child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(data: data.copyWith(textScaler: const TextScaler.linear(1.10),), child: child!);
          },
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: 'DMSans'
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
