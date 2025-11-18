
import 'package:gt_tbb/core/commonStyle/custom_toast.dart';
import 'package:gt_tbb/view/AuthenticationView/controller/authentication_controller.dart';
import 'package:gt_tbb/view/AuthenticationView/view/signInView.dart';
import 'package:gt_tbb/view/AuthenticationView/view/signUpOtpView.dart';
import '../../../core/utils/import_list.dart';

class SignUpView extends GetView<AuthenticationController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationController controller = Get.put(AuthenticationController());
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

                heightBox20,
                CustomText(
                  text: 'Name',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),
                heightBox5,
                CustomTextField(
                  hintText: 'Enter your name',
                  showObscure: false,
                  controller: controller.nameController,
                ),

                heightBox10,

                CustomText(
                  text: 'Email',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),
                heightBox5,
                CustomTextField(
                  hintText: 'Enter your email',
                  showObscure: false,
                  controller: controller.emailController,
                ),


                heightBox10,
                CustomText(
                  text: 'Password',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),
                heightBox5,
                CustomTextField(
                  hintText: "********",
                  showObscure: true,
                  controller: controller.passwordController,
                ),

                heightBox10,
                CustomText(
                  text: 'Confirm Password',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),
                heightBox5,
                CustomTextField(
                  hintText: "********",
                  showObscure: true,
                  controller: controller.confirmPasswordController,
                ),

                heightBox20,
            CustomButtonWidget(
              btnText: 'Sign Up',
              btnTextSize: 16,
              onTap: () {
                final name = controller.nameController.text.trim();
                final email = controller.emailController.text.trim();
                final password = controller.passwordController.text.trim();
                final confirmPassword = controller.confirmPasswordController.text.trim();

                // Name empty
                if (name.isEmpty) {
                  CustomToast.showToast(message: 'Please enter your name', isError: true);
                  return;
                }

                // Email empty
                if (email.isEmpty) {
                  CustomToast.showToast(message: 'Please enter your email', isError: true);
                  return;
                }

                // Email format check
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(email)) {
                  CustomToast.showToast(message: 'Please enter a valid email', isError: true);
                  return;
                }

                // Password empty
                if (password.isEmpty) {
                  CustomToast.showToast(message: 'Please enter your password', isError: true);
                  return;
                }

                // Password min length
                if (password.length < 6) {
                  CustomToast.showToast(
                      message: 'Password must be at least 6 characters',
                      isError: true
                  );
                  return;
                }

                // Confirm password empty
                if (confirmPassword.isEmpty) {
                  CustomToast.showToast(
                      message: 'Please enter your confirm password',
                      isError: true
                  );
                  return;
                }

                // Password match
                if (password != confirmPassword) {
                  CustomToast.showToast(
                      message: 'Password does not match',
                      isError: true
                  );
                  return;
                }

                // If all validations pass
                controller.createAccount(
                  context: context,
                  name: name,
                  email: email,
                  password: password,
                );
              },
              iconWant: false,
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
