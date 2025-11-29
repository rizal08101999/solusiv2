import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/colors.dart';


class PopUpNotifikasi extends StatelessWidget {
  const PopUpNotifikasi({
    super.key,
    this.onTap,
    this.padding,
    required this.status,
    required this.title,
    required this.msg,
  });

  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final RxBool status;
  final String title;
  final String msg;
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 65),
        child: Material(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Obx(() => status.isTrue ? 
                        Center(
                          child: Lottie.asset(
                            "assets/images/anm_fail.json",
                            width: 250
                          ),
                        ) : 
                        Center(
                          child: Lottie.asset(
                            "assets/images/anm_sucsess.json",
                            width: 250
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
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
                      Text(
                        msg,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Obx(() => SizedBox(height: status.isTrue ? 10 : 20,),),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),

                /// === BUTTON OKAY ===
                InkWell(
                  onTap: onTap ?? () => Navigator.pop(context),
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    alignment: Alignment.center,
                    child: Text(
                      "Okay",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: 'SemiBold',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
