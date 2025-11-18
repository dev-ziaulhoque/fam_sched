
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gt_tbb/core/commonWidget/custom_text_widget.dart';
import '../../../../core/commonStyle/app_colors.dart';
import '../../../../core/commonStyle/app_images.dart';
import '../../../../core/commonWidget/custom_size.dart';

class NotificationDialogView extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onAccept;
  final VoidCallback onDeny;

  const NotificationDialogView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onAccept,
    required this.onDeny,
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

                  CustomText(
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 14.h),

                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [

                          SizedBox(
                            height: 16,
                            width: 16,
                            child: Image.asset(AppImages.time),
                          ),

                          SizedBox(width: 4.h),

                          CustomText(
                            text: 'Time:',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),

                          widthBox5,

                          CustomText(
                            text: '4.00 AM',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          )
                        ],
                      ),

                      Row(
                        children: [

                          SizedBox(
                            height: 16,
                            width: 16,
                            child: Image.asset(AppImages.date),
                          ),
                          SizedBox(width: 4.h),

                          CustomText(
                            text: 'Date:',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),

                          widthBox5,

                          CustomText(
                            text: '11-11-2025',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          )
                        ],
                      )


                    ],
                  ),

                  SizedBox(height: 14.h),

                  Row(
                    children: [

                      Icon(Icons.person,color: Colors.black54,),

                      SizedBox(
                        width: 5.w,
                      ),
                      CustomText(
                        text: 'Created By:',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),

                      SizedBox(
                        width: 5.w,
                      ),

                      CustomText(
                        text: 'Emma',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),


                    ],
                  ),

                  SizedBox(height: 14.h),

                  // 🔹 Subtitle
                  CustomText(
                    text: subTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withOpacity(0.8),
                    textAlign: TextAlign.center,
                  ),



                  SizedBox(height: 25.h),

                  Row(
                    children: [

                      Expanded(
                          child:  GestureDetector(
                            onTap: onAccept,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.mainColor,
                                  )
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Deny',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          )
                      ),

                      widthBox10,

                      Expanded(
                          child:  GestureDetector(
                            onTap: onDeny,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF3C353B),
                                      Color(0xFF785E57),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.mainColor,
                                  )
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Accept',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color:Colors.white,
                                ),
                              ),
                            ),
                          )
                      ),


                    ],
                  )
                  // 🔹 Button

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
