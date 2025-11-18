import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/commonWidget/custom_app_bar_widget.dart';

import '../../../../commonStyle/app_colors.dart';
import '../../../../commonWidget/custom_button_widget.dart';
import '../../../../commonWidget/custom_size.dart';
import '../../../../commonWidget/custom_text_filed.dart';
import '../../../../commonWidget/custom_text_widget.dart';

class AddFamilyMemberView extends StatelessWidget {
  const AddFamilyMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Group Member'),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              heightBox20,


              Row(
                children: [
                  Icon(Icons.add, color: Color(0XFF3C353B)),

                  widthBox10,

                  CustomText(
                    text: 'Add Gorup Member',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                ],
              ),

              heightBox20,

              CustomText(
                text: 'Name',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0XFF4F4F4F),
              ),
              heightBox10,

              CustomTextField(
                  hintText: 'mehedi hasan',
                  showObscure: false
              ),

              heightBox20,

              CustomText(
                text: 'Email',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0XFF4F4F4F),
              ),
              heightBox10,

              CustomTextField(
                  hintText: 'mehedi@gmail.com',
                  showObscure: false
              ),



              heightBox20,

              CustomText(
                text: 'Password',
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
                  btnText: 'Send Invitation',
                  onTap: (){},
                  iconWant: false
              ),


              heightBox50,

            ],
          ),
        ),
      ),
    );
  }
}
