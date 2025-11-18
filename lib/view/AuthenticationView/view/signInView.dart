import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gt_tbb/commonStyle/app_colors.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';
import 'package:gt_tbb/commonWidget/custom_text_filed.dart';
import 'package:gt_tbb/commonWidget/divider_with_text.dart';
import 'package:gt_tbb/view/AuthenticationView/view/signUpView.dart';
import 'package:gt_tbb/view/homeView/homeView.dart';
import '../../../commonWidget/customCheckBox_widget.dart';
import '../../../commonWidget/custom_size.dart';
import '../../../commonWidget/custom_text_widget.dart';
import '../../../commonWidget/socialLoginWidget.dart';
import 'logInForgotView.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 14.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CustomText(
                  text: 'Welcome Back',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF121212),
                ),
            
                heightBox10,
            
                CustomText(
                  text: 'Please Enter your email and Password for sign in',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
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


                heightBox20,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        CustomCheckbox(
                          initialValue: false,
                          onChanged: (bool value) {
                            print("Checkbox is now: $value");
                          },
                        ),
                        widthBox10,
                        CustomText(
                          text: 'Keep me logged in',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF5C5C5C),
                        )
                      ],
                    ),

                    GestureDetector(
                      onTap: ()=> Get.to(LogInForgotView()),
                      child: CustomText(
                        text: 'Forgot Password?',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF5C5C5C),
                      ),
                    )
                  ],
                ),



                heightBox30,

                CustomButtonWidget(
                    btnText: 'Log In',
                    btnTextSize: 16,
                    onTap: (){
                     //
                      Get.offAll(HomeView());
                    },
                    iconWant: false
                ),

                heightBox20,

                DividerWithText(text: 'Or'),

                heightBox14,

                SocialWidget(
                  onTap: () async {
                  },
                ),

                heightBox20,

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Don\'t have an account?',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                      widthBox10,
                      GestureDetector(
                        onTap: ()=> Get.to(SignUpView()),
                        child: CustomText(
                          text: 'Sign Up',
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
