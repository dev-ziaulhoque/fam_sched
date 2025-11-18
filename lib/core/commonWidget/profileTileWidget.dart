import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../commonStyle/app_colors.dart';
import 'custom_size.dart';
import 'custom_text_widget.dart';


class ProfileTileWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final Callback? onTap;

  const ProfileTileWidget({
    super.key,
    required this.imagePath,
    required this.title, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            children: [
               Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      height: 14.h,
                      width: 14.w,
                    ),
                  ),
                ),
              widthBox14,
              GestureDetector(
                onTap: onTap,
                child: CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),

            ],
          ),
          Icon(
              Icons.arrow_forward_ios_rounded,
            size: 15.h,
            color: Color(0XFF99A1AF),
            
          )

        ],
      ),
    );
  }
}
