import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:solusi/app/routes/app_pages.dart';
import 'package:solusi/core/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: DataColors.bg,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: ScreenUtilInit(
          designSize: const Size(450 * .95, 869 * .95),
          builder: (_, child) {
            return GetMaterialApp(
              title: 'Solusi',
              theme: ThemeData(
                  scaffoldBackgroundColor: DataColors.white,
                  fontFamily: 'Poppins'),
              debugShowCheckedModeBanner: false,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          },
        ));
  }
}
