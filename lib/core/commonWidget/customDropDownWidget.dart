// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../commonStyle/app_colors.dart';

class CustomDropDownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;

  const CustomDropDownWidget({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ensure unique values
    final uniqueItems = items.toSet().toList();

    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.055,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFF8F9FA),
        border: Border.all(
          color: borderColor ?? const Color(0xFFB0B0B0),
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),

          value: uniqueItems.contains(selectedValue) ? selectedValue : null,
          hint: Text(
            hintText,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
            ),
          ),

          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
          ),

          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xFF212529),
            size: 26,
          ),

          items: uniqueItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  const Icon(
                    Icons.circle,
                    size: 8,
                    color: Color(0xFF6C63FF),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    value,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }
}
