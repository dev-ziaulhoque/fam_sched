import 'package:flutter/material.dart';

import '../commonStyle/app_colors.dart';
import '../commonStyle/app_images.dart';

class SocialWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const SocialWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.mainColor, width: 0.35),
            ),

            child: Padding(
              padding: EdgeInsets.all(15),
              child: Image.asset(AppImages.Google, width: 36),
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.mainColor, width: 0.35),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Image.asset(AppImages.Apple, width: 44, height: 35),
          ),
        ),
      ],
    );
  }
}
