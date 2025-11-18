import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commonStyle/app_colors.dart';
import '../../../../core/commonStyle/app_images.dart';
 
import '../../../../core/commonWidget/custom_size.dart';
import '../../../../core/commonWidget/custom_text_widget.dart';

class UpComingWidget extends StatelessWidget {

  final String title;
  final String timer;
  final VoidCallback onTap;
  const UpComingWidget({
    required this.title,
    required this.timer,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0XFFF5F2F9),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(228, 229, 231, 0.24),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
        border: const Border(
          top: BorderSide(color: Color(0xFF8A38F5), width: 0.1),
          right: BorderSide(color: Color(0xFF8A38F5), width: 0.1),
          bottom: BorderSide(color: Color(0xFF8A38F5), width: 0.1),
          left: BorderSide(color: Color(0xFF8A38F5), width: 2.5),
        ),

      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                    children: [

                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          AppImages.upcoming,
                          height: 25.h,
                          width: 25.w,
                        ),
                      ),

                      widthBox10,
                      CustomText(
                        text: title,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor,
                      )


                    ]


                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0XFFAA75F0).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Upcoming',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFF8A38F5),
                    ),
                  ),
                )

              ],
            ),

            heightBox20,

            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0XFFAC6CFF).withOpacity(0.06),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: Color(0XFF8A38F5).withOpacity(0.6),
                      width: 0.35,
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          AppImages.alarm,
                          height: 20.h,
                          width: 20.w,
                          color: Color(0XFF8A38F5),
                        ),
                      ),

                      widthBox10,

                      CustomText(
                        text: timer,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF8A38F5),
                      )
                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}