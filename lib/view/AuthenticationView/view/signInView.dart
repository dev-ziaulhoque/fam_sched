import 'package:gt_tbb/view/AuthenticationView/view/signUpView.dart';
import '../../../core/commonWidget/divider_with_text.dart';
import '../../../core/utils/import_list.dart';
import '../../homeView/homeView.dart';
import 'logInForgotView.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    hintText: 'Enter Email',
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
                      onTap: ()=> Get.to(()=>LogInForgotView()),
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
                      Get.offAll(()=>HomeView());
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
                        onTap: ()=> Get.to(()=>SignUpView()),
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
