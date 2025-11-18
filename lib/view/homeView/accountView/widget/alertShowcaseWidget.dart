import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/core/commonStyle/app_colors.dart';
import 'package:gt_tbb/core/commonWidget/custom_button_widget.dart';
import 'package:gt_tbb/core/commonWidget/custom_text_widget.dart';
import 'package:showcaseview/showcaseview.dart';

class RemainderAlertWithShowcase extends StatefulWidget {
  final VoidCallback onShowcaseComplete;

  const RemainderAlertWithShowcase({
    super.key,
    required this.onShowcaseComplete,
  });

  @override
  State<RemainderAlertWithShowcase> createState() =>
      _RemainderAlertWithShowcaseState();
}

class _RemainderAlertWithShowcaseState
    extends State<RemainderAlertWithShowcase> {
  final GlobalKey _remainderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      onComplete: (index, key) {
        widget.onShowcaseComplete();
      },
      builder: (showcaseContext) => _RemainderAlertContent(
        remainderKey: _remainderKey,
        onButtonPressed: () {
          ShowCaseWidget.of(showcaseContext).dismiss();
          widget.onShowcaseComplete();
        },
      ),
    );
  }
}

class _RemainderAlertContent extends StatefulWidget {
  final GlobalKey remainderKey;
  final VoidCallback onButtonPressed;

  const _RemainderAlertContent({
    required this.remainderKey,
    required this.onButtonPressed,
  });

  @override
  State<_RemainderAlertContent> createState() => _RemainderAlertContentState();
}

class _RemainderAlertContentState extends State<_RemainderAlertContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([widget.remainderKey]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Center(
        child: Showcase(
          key: widget.remainderKey,
          title: 'Set Remainder Alerts',
          description:
          'Configure your reminder preferences here. Choose when and how you want to receive alerts for important events and tasks.',
          targetPadding: EdgeInsets.all(16),
          tooltipBackgroundColor: AppColors.mainColor,
          tooltipPadding: EdgeInsets.all(16),
          textColor: Colors.white,
          descTextStyle: TextStyle(
            fontSize: 12.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          titleTextStyle: TextStyle(
            fontSize: 15.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          disposeOnTap: false,
          onTargetClick: () {
            widget.onButtonPressed();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.notifications_active,
                  size: 60,
                  color: AppColors.mainColor,
                ),
                SizedBox(height: 16),
                CustomText(
                 text:  'Remainder Alert Settings',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                CustomText(
                  text: 'Tap here to customize your alert preferences',
                    fontSize: 14.sp,
                    color: Colors.black54,
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 24),

                CustomButtonWidget(
                    btnText: 'Continue',
                    onTap: widget.onButtonPressed,
                    iconWant: false
                )

                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: widget.onButtonPressed,
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Color(0xFF497DE2),
                //       padding: EdgeInsets.symmetric(vertical: 14),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //     ),
                //     child: Text(
                //       'Got It, Continue',
                //       style: TextStyle(
                //         fontSize: 16.sp,
                //         fontWeight: FontWeight.w600,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

