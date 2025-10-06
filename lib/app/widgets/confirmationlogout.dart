// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';

class ConfirmationLogout extends StatelessWidget {
  const ConfirmationLogout({
    super.key,
    this.onTap,
    this.alignment = CrossAxisAlignment.start,
    this.padding,
    required this.subtitle,
    required this.title,
    required this.textbuttonaccept,
    required this.onPressedaccept,
    required this.onPresseddenied,
  });

  final Function(String)? onTap;
  final CrossAxisAlignment alignment;
  final EdgeInsets? padding;
  final String title;
  final String subtitle;
  final String textbuttonaccept;
  final VoidCallback onPresseddenied;
  final VoidCallback onPressedaccept;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Material(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/img_logout3.png',
                  width: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'SemiBold',
                      color: AppColors.black
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.grey5
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: onPresseddenied,
                          overlayColor: WidgetStateProperty.all(Colors.transparent),
                          child: Container(
                            padding: EdgeInsets.all(2), // tebal border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gradientnavbar,
                                  AppColors.gradientnavbar2
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white, // isi background container
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  begin: Alignment.bottomCenter, // mulai dari bawah
                                  end: Alignment.topCenter,     // ke atas
                                  colors: [
                                    AppColors.gradientnavbar,
                                    AppColors.gradientnavbar2
                                  ],
                                ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                                child: Text(
                                  "Batal",
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // wajib set putih, supaya gradient kelihatan
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: InkWell(
                          onTap: onPressedaccept,
                          overlayColor: WidgetStateProperty.all(Colors.transparent),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // tebal border
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(999),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gradientnavbar,
                                  AppColors.gradientnavbar2
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Text(
                              textbuttonaccept,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // wajib set putih, supaya gradient kelihatan
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
