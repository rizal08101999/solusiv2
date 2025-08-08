import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../core/colors.dart';


class PopUpLoad extends StatelessWidget {
  const PopUpLoad({
    super.key,
    this.onTap,
    this.alignment = CrossAxisAlignment.start,
    this.padding,
    this.isdownload,
    this.progress,
    this.text
  });

  final Function(String)? onTap;
  final CrossAxisAlignment alignment;
  final EdgeInsets? padding;
  final bool? isdownload;
  final String? text;
  final ValueNotifier<String>? progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.white
          ),
          child: isdownload != null  ?
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/images/load.json',
                  width: 150
                ),
                 ValueListenableBuilder<String>(
                  valueListenable: progress!,
                  builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Bold',
                          color: AppColors.black8
                        ),
                      ),
                    );
                  },
                )
              ],
            )
            :
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/images/load.json',
                  width: 80
                ),
                text != null ?
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    text!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Medium',
                      color: AppColors.black8
                    ),
                    textAlign: TextAlign.center,
                  ),
                ) : const SizedBox.shrink()
              ],
            )
        ),
      ),
    );
  }
}
