import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gt_tbb/commonWidget/custom_size.dart';
import 'package:gt_tbb/view/homeView/accountView/view/notificationView.dart';
import 'package:gt_tbb/view/homeView/calenderView/view/tomorrowView.dart';
import 'package:gt_tbb/view/homeView/calenderView/view/upcommingView.dart';

import '../../../../commonStyle/app_colors.dart';
import '../../../../commonStyle/app_images.dart';
import '../../../../commonWidget/custom_text_widget.dart';
import '../widget/homeWidget.dart';
import 'todayView.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Hello!',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor,
                        ),
                        CustomText(
                          text: 'Good morning, Emma Johnson!',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => NotificationView()),
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                        color: Color(0XFFEAEAEA),
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
                  )
                ],
              ),

              heightBox14,
              

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  //Today
                  GestureDetector(
                    onTap: ()=> Get.to(()=> TodayScreen()),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Color(0XFFE8E8E8),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child:  Center(
                        child: CustomText(
                          text: 'Today',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),

                  widthBox10,

                  //Tomorrow
                  GestureDetector(
                    onTap: ()=> Get.to(()=> TomorrowScreen()),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Color(0XFFE8E8E8),
                        borderRadius: BorderRadius.circular(14.r),

                      ),
                      child:  Center(
                        child: CustomText(
                          text: 'Tomorrow',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),

                  widthBox10,

                  //UpComing
                  GestureDetector(
                    onTap: ()=> Get.to(()=> UpComingScreen()),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Color(0XFFE8E8E8),
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child:  Center(
                        child: CustomText(
                          text: 'UpComing',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),


                ],
              ),

              heightBox10,

              Expanded(
                child: const HomeWidget(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
