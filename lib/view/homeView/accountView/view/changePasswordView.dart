import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/commonWidget/custom_app_bar_widget.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';

import '../../../../commonWidget/custom_size.dart';
import '../../../../commonWidget/custom_text_filed.dart';
import '../../../../commonWidget/custom_text_widget.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Change Password'),

      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  heightBox20,

                  CustomText(
                    text: 'Current Password',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF4F4F4F),
                  ),
                  heightBox10,
                  CustomTextField(
                    hintText: "********",
                    showObscure: true,
                  ),

                  heightBox20,

                  CustomText(
                    text: 'New Password',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF4F4F4F),
                  ),
                  heightBox10,
                  CustomTextField(
                    hintText: "********",
                    showObscure: true,
                  ),
                  heightBox20,

                  CustomText(
                    text: 'Confirm Password',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF4F4F4F),
                  ),
                  heightBox10,
                  CustomTextField(
                    hintText: "********",
                    showObscure: true,
                  ),



                  heightBox50,

                  CustomButtonWidget(
                      btnText: 'Change Password',
                      onTap: (){},
                      iconWant: false
                  ),


                  heightBox20,




                ],
            ),
          ),
      ),
    );
  }
}
