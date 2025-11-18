import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gt_tbb/core/utils/import_list.dart';
import 'package:gt_tbb/view/AuthenticationView/controller/otp_controller.dart';
import 'package:gt_tbb/view/AuthenticationView/view/signInView.dart';

import '../../../core/commonStyle/custom_toast.dart';

class SignUpOtpVerifyView extends GetView<OtpController> {
  final String email;
  const SignUpOtpVerifyView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // Put controller once (or use Get.put in previous screen if you prefer)
    final OtpController controller = Get.put(OtpController());

    // Controller for the OTP text field
    final TextEditingController otpController = TextEditingController();

    final otpCon = List.generate(6, (index) => TextEditingController());

    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Center(
            child: Obx(
              ()=> Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  heightBox50,

                  CustomText(
                    text: 'Verification Code',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF121212),
                  ),

                  heightBox10,

                  CustomText(
                    text: 'Please enter your code',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF4F4F4F),
                  ),

                  heightBox30,

                  // OTP Input Field
                  CustomOtpWidget(
                    controllers: otpCon,
                    numberOfFields: 6,
                    borderColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  ),

                  heightBox30,

                  // Timer + Resend Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      controller.remainingSeconds.value > 0?SizedBox():
                      CustomText(
                        text: "Didn't receive your OTP? ",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF4F4F4F),
                      ),

                      if (!controller.isResendEnabled.value) ...[
                        CustomText(
                          text: "Resend in ${controller.remainingSeconds.value}s",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFA11C11),
                        ),
                      ] else ...[
                        GestureDetector(
                          onTap: controller.isLoading.value
                              ? null
                              : () async {
                            await controller.resendOtp(email: email);
                          },
                          child: controller.isLoading.value
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                              : CustomText(
                            text: 'Resend Code',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFA11C11),
                            underline: false,
                          ),
                        ),
                      ],
                    ],
                  ),

                  const Spacer(),

                  // Verify Button
                  CustomButtonWidget(
                    btnText: 'Verify',
                    btnTextSize: 16,
                    onTap: () async {
                      String otp = otpCon.map((controller) => controller.text).join();
                      if (otp.length == 6) {
                        await controller.verifyOtp(otp: otp);
                      } else {
                        CustomToast.showToast(
                            message: "Please enter a valid 6-digit OTP",
                            isError: true,
                        );
                      }
                    },
                    iconWant: false,
                  ),

                  heightBox30,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}