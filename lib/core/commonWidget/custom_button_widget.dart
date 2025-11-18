// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String btnText;
  final double? btnTextSize;
  final double? iconSize;
  final bool iconWant;
  final Color? btnTextColor;
  final Color? btnColor;
  final Color? borderColor;
  final IconData? iconData;
  final Color? suffixIconColor;
  final VoidCallback onTap;
  final Gradient? gradient;

  const CustomButtonWidget({
    super.key,
    required this.btnText,
    required this.onTap,
    this.gradient,
    this.borderColor,
    this.btnTextColor,
    this.btnTextSize,
    required this.iconWant,
    this.iconData,
    this.suffixIconColor,
    this.iconSize,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38.h,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: gradient ??
              (btnColor == null
                  ? LinearGradient(
                colors: [
                  const Color(0xFF3C353B),
                  const Color(0xFF785E57),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
                  : null),
          color: gradient == null ? btnColor : null,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconWant)
                  FaIcon(
                    iconData,
                    size: iconSize ?? 22.h,
                    color: suffixIconColor ?? Colors.white,
                  ),
                if (iconWant) SizedBox(width: 8.w),
                CustomText(
                text:   btnText,
                    fontSize: btnTextSize ?? 16.sp,
                    color: btnTextColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
