import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:gt_tbb/core/commonWidget/custom_text_widget.dart';
import 'package:gt_tbb/view/homeView/accountView/view/AlertView.dart';
import '../../../../core/commonStyle/app_colors.dart';
import '../../../../core/commonWidget/custom_size.dart';

class AlertPreferenceCard extends StatefulWidget {
  const AlertPreferenceCard({super.key});

  @override
  State<AlertPreferenceCard> createState() => _AlertPreferenceCardState();
}

class _AlertPreferenceCardState extends State<AlertPreferenceCard> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 300.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            // Option 1
            GestureDetector(
              onTap: () {
                setState(() => selected = 0);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Get Remainder alerts for all events I’m part of',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: selected == 0
                          ? AppColors.textColor
                          : Colors.grey,
                    ),
                  ),

                  widthBox10,

                  Container(
                    height: 20.w,
                    width: 20.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected == 0 ? AppColors.mainColor : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected == 0
                              ? AppColors.mainColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            heightBox20,

            // Option 2
            GestureDetector(
              onTap: () {
                setState(() => selected = 1);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Get Remainder alerts only for events assigned to me',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: selected == 1
                          ? AppColors.textColor
                          : Colors.grey,
                    ),
                  ),

                  widthBox10,

                  Container(
                    height: 20.w,
                    width: 20.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected == 1 ? AppColors.mainColor : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected == 1
                              ? AppColors.mainColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Only show buttons when an option is selected
            if (selected != null) ...[
              heightBox20,
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            width: 1,
                            color: AppColors.mainColor,
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Cancel',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  widthBox20,
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3C353B),
                              Color(0xFF785E57),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            width: 1,
                            color: AppColors.mainColor,
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Ok',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
