import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commonStyle/app_colors.dart';
import '../../../../core/commonStyle/app_images.dart';
import '../../../../core/commonWidget/custom_text_widget.dart';

class CustomNotification extends StatelessWidget {
  final String message;
  final String time;
  final String timeAgo;
  final VoidCallback onTap;

  const CustomNotification({
    super.key,
    required this.message,
    required this.time,
    required this.timeAgo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification Icon
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Color(0XFFEFEDEC),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AppImages.notification,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),

            SizedBox(width: 12.w),

            // Message & Time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: message,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    text: time,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withOpacity(0.7),
                  ),
                ],
              ),
            ),

            SizedBox(width: 14.w),

            // Time Ago
            CustomText(
              text: timeAgo,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
