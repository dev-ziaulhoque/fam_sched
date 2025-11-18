
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gt_tbb/commonStyle/app_colors.dart';
import 'package:gt_tbb/commonWidget/custom_app_bar_widget.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';
import 'package:gt_tbb/commonWidget/custom_text_filed.dart';
import 'package:gt_tbb/view/AuthenticationView/view/signInView.dart';
import 'package:gt_tbb/view/AuthenticationView/view/signUpOtpView.dart';
import '../../../commonWidget/custom_size.dart';
import '../../../commonWidget/custom_text_widget.dart';
import '../widget/alertDiallogWidget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 14.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomText(
                  text: 'Sign  Up',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF121212),
                ),

                heightBox8,

                CustomText(
                  text: 'Create an account to continue!',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),

                heightBox30,
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





                heightBox30,

                CustomButtonWidget(
                    btnText: 'Sign Up',
                    btnTextSize: 16,
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => CustomCenterDialog(
                          title: "Check Your Email",
                          subTitle: "We have sent instruction to your email please check ",
                          onTap: ()=> Get.to(SignUpOtpVerifyView()),
                        ),
                      );
                    },
                    iconWant: false
                ),



                heightBox20,

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Already have an account?',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                      widthBox10,
                      GestureDetector(
                        onTap: ()=> Get.to(SignInView()),
                        child: CustomText(
                          text: 'Log In',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
