// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/colors.dart';

class FieldForm extends StatelessWidget {
  final String? label;
  final Widget? label2;
  final Widget? content;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final RxBool isnotemptyfield;
  final RxBool isshowrequiredfield;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool enabled;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;
  final VoidCallback? onTap;

  const FieldForm({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.label2,
    this.content,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    required this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.hintStyle,
    this.textStyle,
    this.contentPadding,
    required this.labelStyle,
    required this.isnotemptyfield,
    required this.isshowrequiredfield,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label!,
              style: labelStyle ?? const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            if (label2 != null) label2!
          ],
        ),
        controller != null ?
        Obx(() => Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.done,
            validator: validator,
            onChanged: onChanged,
            maxLines: maxLines,
            enabled: enabled,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: isnotemptyfield.isTrue ? 'Medium' : 'DMSans',
              color: AppColors.black2,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: AppColors.grey2,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey10),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder :OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey10),
                borderRadius: BorderRadius.circular(8),
              ), 
              filled: true,
              fillColor: isnotemptyfield.isTrue ? AppColors.red : AppColors.white,
            ),
          ),
        ),) 
        :
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: InkWell(
            onTap: onTap,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.grey10),
                color: isnotemptyfield.isTrue ? AppColors.red : AppColors.white
              ),
              child: content ?? const SizedBox.shrink()
            ),
          ),
        ),
        Obx(() => isshowrequiredfield.isTrue ?
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "*wajib diisi",
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Medium',
                color: AppColors.red
              )
            ),
          ) : const SizedBox.shrink()
        )
      ],
    );
  }
}