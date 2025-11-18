import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commonStyle/app_colors.dart';
 
import '../../../../core/commonWidget/custom_size.dart';
import '../../../../core/commonWidget/custom_text_widget.dart';

class SingleGroupMember extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final VoidCallback? onDelete;

  const SingleGroupMember({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // ✅ Profile Image
          CircleAvatar(
            radius: 35.r,
            backgroundImage: NetworkImage(imageUrl),
          ),

          widthBox10,

          // ✅ Name + Email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
                SizedBox(height: 3.h),
                CustomText(
                  text: email,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0XFF676769),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // ✅ Delete button
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
