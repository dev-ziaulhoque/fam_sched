
import '../../../core/utils/import_list.dart';
import 'newPasswordView.dart';

class LogInVerifyView extends StatelessWidget {
  const LogInVerifyView({super.key});

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                heightBox50,


                CustomText(
                  text: 'Verification Code',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF121212),
                ),

                heightBox10,

                CustomText(
                  text: 'Please enter your code ',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),

                heightBox30,

                // CustomOtpField(
                //   length: 6,
                //   borderColor: AppColors.mainColor,
                //   borderWidth: 1,
                //   onChanged: (value) {
                //     print("OTP input: $value");
                //   },
                // ),

                heightBox20,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Didn’t receive your otp?',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF4F4F4F),
                    ),

                    widthBox10,

                    CustomText(
                      text: 'Resend Code',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFFA11C11),
                      underline: true,
                    ),

                  ],
                ),


                heightBox50,

                CustomButtonWidget(
                    btnText: 'Verify',
                    btnTextSize: 16,
                    onTap: (){
                     print('object');
                     Get.to(() => NewPasswordView());
                    },
                    iconWant: false
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
