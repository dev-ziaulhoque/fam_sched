
import 'package:gt_tbb/core/commonWidget/custom_text_widget.dart';
import 'package:gt_tbb/view/AuthenticationView/view/logInVerifyView.dart';
import '../../../core/utils/import_list.dart';
import '../widget/alertDiallogWidget.dart';

class LogInForgotView extends StatelessWidget {
  const LogInForgotView({super.key});

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
                  text: 'Forgot Password',
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

                heightBox50,

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




                heightBox40,

                CustomButtonWidget(
                    btnText: 'Send Code',
                    btnTextSize: 16,
                    onTap: (){
                      //
                      showDialog(
                        context: context,
                        builder: (context) => CustomCenterDialog(
                          title: "Check Your Email",
                          subTitle: "We have sent instruction to your email please check ",
                          onTap: ()=> Get.to(LogInVerifyView()),
                        ),
                      );
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
