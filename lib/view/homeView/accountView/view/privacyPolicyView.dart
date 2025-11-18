import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/core/commonStyle/app_colors.dart';
import 'package:gt_tbb/core/commonStyle/app_string.dart';
import 'package:gt_tbb/core/commonWidget/custom_app_bar_widget.dart';
import 'package:gt_tbb/core/commonWidget/custom_text_widget.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Privacy Policy'),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.privacyPolicy,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
