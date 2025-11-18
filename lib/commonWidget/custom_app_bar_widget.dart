import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../commonStyle/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool forceMaterialTransparency;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.fontSize,
    this.centerTitle = true,
    this.backgroundColor = Colors.transparent,
    this.forceMaterialTransparency = true,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading,
    this.onTap,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: GoogleFonts.abhayaLibre(
          fontSize: fontSize ?? 18.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading ??
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: GestureDetector(
              onTap: onTap ?? () {
                    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      if (kDebugMode) print("No routes to pop");
                    }
                  },
              child: Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0XFFD9D9D9),
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.textColor,
                  size: 16.h,
                ),
              ),
            ),
          ),

      elevation: forceMaterialTransparency ? 0 : null,
    );
  }
}
