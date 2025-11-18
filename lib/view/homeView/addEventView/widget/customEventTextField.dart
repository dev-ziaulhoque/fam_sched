import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/commonStyle/app_colors.dart';

class CustomEventTextField extends StatefulWidget {
  final String hintText;
  final bool showObscure;
  final bool? readOnly;
  final IconData? prefixIcon;
  final IconData? postfixIcon;
  final VoidCallback? onPostfixTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? borderColor;
  final int? maxLines;

  const CustomEventTextField({
    Key? key,
    required this.hintText,
    required this.showObscure,
    this.keyboardType,
    this.controller,
    this.prefixIcon,
    this.postfixIcon,
    this.onPostfixTap,
    this.fillColor,
    this.borderColor,
    this.maxLines,
    this.readOnly,
  }) : super(key: key);

  @override
  _CustomEventTextFieldState createState() => _CustomEventTextFieldState();
}

class _CustomEventTextFieldState extends State<CustomEventTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: widget.fillColor ?? Colors.white,
        // boxShadow: const [
        //   BoxShadow(
        //     color: Color.fromRGBO(228, 229, 231, 0.24),
        //     offset: Offset(0, 1),
        //     blurRadius: 2,
        //   ),
        // ],
        border: Border.all(
          color: Color(0XFFE8E8E8) ?? Colors.transparent,
          width: 1.w,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        readOnly: widget.readOnly ?? false,
        obscureText: widget.showObscure ? _obscureText : false,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          border: InputBorder.none,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: AppColors.mainColor)
              : null,

          suffixIcon: widget.showObscure
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.mainColor,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : widget.postfixIcon != null
              ? IconButton(
            icon: Icon(widget.postfixIcon, color: AppColors.mainColor,size: 20,),
            onPressed: widget.onPostfixTap,
          )
              : null,

          hintText: widget.hintText,
          hintStyle: GoogleFonts.lato(fontSize: 12.sp),
        ),
      ),
    );
  }
}
