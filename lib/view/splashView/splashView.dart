import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gt_tbb/commonStyle/app_images.dart';
import 'package:gt_tbb/view/onBoardingView/onBoardingView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    _navigateToOnBoarding();
  }

  // Navigate after delay
  void _navigateToOnBoarding() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() =>  OnBoardingView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(seconds: 2),
          child: Image.asset(
            AppImages.onBoarding1,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
