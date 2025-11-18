import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gt_tbb/commonStyle/app_images.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';
import 'package:gt_tbb/commonWidget/custom_text_widget.dart';
import 'package:gt_tbb/view/AuthenticationView/view/logInVerifyView.dart';
import '../../../commonStyle/app_colors.dart';

class CustomCenterDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const CustomCenterDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 🔹 Main Dialog Body
            Container(
              width: 320.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
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
                children: [


                  // 🔹 Circular Image Container
                  Container(
                    height: 80.h,
                    width: 80.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.mainColor,
                        width: 1.w,
                      ),
                    ),
                    padding: EdgeInsets.all(12.w),
                    child: Center(
                      child: Image.asset(
                        AppImages.mailBox,
                        height: 40.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),

                  // 🔹 Title
                  CustomText(
                    text: title,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),

                  // 🔹 Subtitle
                  CustomText(
                    text: subTitle,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withOpacity(0.8),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.h),

                  // 🔹 Button
                  CustomButtonWidget(
                    btnText: 'Done',
                    onTap: onTap, //()=> Get.to(LogInVerifyView()),
                    iconWant: false,
                  ),
                ],
              ),
            ),

            // 🔹 Close Button (top right)
            Positioned(
              top: -10,
              right: -10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(6.w),
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
