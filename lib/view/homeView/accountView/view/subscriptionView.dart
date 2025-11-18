import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/commonWidget/custom_app_bar_widget.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';
import 'package:gt_tbb/commonWidget/custom_size.dart';
import 'package:gt_tbb/commonWidget/custom_text_widget.dart';

import '../../../../commonStyle/app_colors.dart';

class ManageSubscriptionView extends StatelessWidget {
  const ManageSubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Manage Subscription'),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          child: Column(
            children: [


              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: CustomText(
                        text: 'On Going Plan',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),

                    heightBox10,


                    CustomText(
                      text: '9.99\$ / month',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),

                    CustomText(
                      text: 'Started on 10 Sep 2025. 20 days left until your next renewal. Don’t worry, we’ll remind you 3 days before your next payment of \$5.00.',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                      textAlign: TextAlign.justify,
                    ),

                    heightBox10,

                    Row(
                      children: [
                        CustomText(
                          text: 'Purchase Date:',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF606060),
                        ),

                        widthBox10,

                        CustomText(
                          text: '10 Oct 2025',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF606060),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'Next Billing Date :',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0XFF606060),
                        ),

                        widthBox10,

                        CustomText(
                          text: '10 Oct 2025',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF606060),
                        ),

                      ],
                    ),

                    heightBox20,

                    CustomButtonWidget(
                        btnText: 'Renew Plan',
                        onTap: (){},
                        iconWant: false)

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
