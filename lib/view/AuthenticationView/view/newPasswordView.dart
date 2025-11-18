import 'package:gt_tbb/view/AuthenticationView/view/signInView.dart';

import '../../../core/utils/import_list.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

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
                  text: 'New Password',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF121212),
                ),

                heightBox10,

                CustomText(
                  text: 'Enter your email account to reset password',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),

                heightBox30,

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



                heightBox50,

                CustomButtonWidget(
                    btnText: 'Change Password',
                    btnTextSize: 16,
                    onTap: (){
                      print('object');
                      Get.to(() => SignInView());
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
