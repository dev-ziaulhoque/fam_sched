import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gt_tbb/commonStyle/app_colors.dart';
import 'package:gt_tbb/commonStyle/app_images.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';
import 'package:gt_tbb/commonWidget/custom_text_widget.dart';
import 'package:gt_tbb/commonWidget/custom_size.dart';
import '../AuthenticationView/view/signInView.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.onBoarding1,
      "title": "Welcome to GT TBB",
      "description":
      "Easily coordinate and manage activities, appointments, and events with your close circle — all in one streamlined platform"
    },
    {
      "image": AppImages.onBoarding2,
      "title": "Easily Create Family Events",
      "description":
      "Plan to manage your schedule with ease Add activities such as school events, after-school classes, and appointments. Keep everyone informed by sharing the schedule and outlining the plan"
    },
    {
      "image": AppImages.onBoarding3,
      "title": "Share Events with Your Family",
      "description":
      "Share Events with Your Group Invite teammates, family members, caregivers, and assistants to access your schedule. Stay organized and aligned on important events, no matter how busy your day gets."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // Skip button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => const SignInView());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CustomText(
                        text: 'Skip',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF332926),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            heightBox20,
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      heightBox20,
                      Center(
                        child: Image.asset(
                          onboardingData[index]["image"]!,
                          width: 335.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                      heightBox20,
                      Center(
                        child: CustomText(
                          text: onboardingData[index]["title"]!,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0XFF121212),
                        ),
                      ),
                      heightBox8,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Center(
                          child: CustomText(
                            text: onboardingData[index]["description"]!,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0XFF121212),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // SmoothPageIndicator
            SmoothPageIndicator(
              controller: _controller,
              count: onboardingData.length,
              effect: WormEffect(
                dotHeight: 7.h,
                dotWidth: 14.w,
                activeDotColor: const Color(0xFF3C353B),
                dotColor: const Color(0XFFE8E8E8),
              ),
            ),

            heightBox100,

            // Next Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomButtonWidget(
                btnText: currentPage == onboardingData.length - 1 ? 'Get Started' : 'Next',
                btnTextSize: 16.sp,
                gradient: AppColors.buttonGradient,
                iconWant: false,
                onTap: () {
                  if (currentPage < onboardingData.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Get.offAll(() => const SignInView());
                  }
                },
              ),
            ),


            heightBox30,
          ],
        ),
      ),
    );
  }
}
