import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../core/commonStyle/app_colors.dart';
 
import '../../../../core/commonWidget/custom_size.dart';
import '../../../../core/commonWidget/custom_text_widget.dart';
import '../../../../core/commonWidget/toggleCheckBox.dart';

class NotificationWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final Callback? onTap;

  const NotificationWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final GlobalKey _toggleKey = GlobalKey();
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      widget.imagePath,
                      height: 18.h,
                      width: 18.w,
                      color: Color(0xFF497DE2),
                    ),
                  ),
                ),
              ),
              widthBox14,
              CustomText(
                text: widget.title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ],
          ),

          // Showcase wrapper for toggle
          Showcase(
            key: _toggleKey,
            title: 'Enable Notifications',
            description:
            'Turn on this switch to receive ${widget.title}. By Enable you can get notification about your related task. You can disable it anytime from your account settings.',
            targetPadding: EdgeInsets.all(8),
            tooltipBackgroundColor: AppColors.mainColor,
            tooltipPadding: EdgeInsets.all(16),
            textColor: Colors.white,
            descTextStyle: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              height: 1.5, // line height for better spacing
            ),
            titleTextStyle: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 1.3, // title line height
            ),
            targetShapeBorder: CircleBorder(),
            titlePadding: EdgeInsets.only(bottom: 8), // title এবং description এর মধ্যে spacing
            child: CustomToggleSwitch(
              initialValue: isToggled,
              onChanged: (val) {
                setState(() {
                  isToggled = val;
                });

                if (val) {
                  Future.delayed(Duration(milliseconds: 300), () {
                    ShowCaseWidget.of(context).startShowCase([_toggleKey]);
                  });
                }

                print('Switch is $val');
              },
            ),
          )
        ],
      ),
    );
  }
}