// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gt_tbb/commonStyle/app_colors.dart';
import 'package:gt_tbb/commonWidget/custom_size.dart';
import 'package:gt_tbb/commonWidget/custom_text_widget.dart';

import '../commonStyle/app_images.dart';
import '../view/homeView/addEventView/view/updateEventView.dart';
import 'customCheckBox_widget.dart';

class CustomContainerDialog {
  static void showContainerDialog() {
    Get.dialog(
      Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0XFFDE8080).withOpacity(0.44),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(
                        text: 'Ballet Class',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor,
                        textAlign: TextAlign.justify,
                      ),

                      heightBox20,

                      Row(
                        children: [

                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppImages.date),
                          ),

                          widthBox10,

                          CustomText(
                            text: 'Tomorrow',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                            textAlign: TextAlign.justify,
                          ),

                        ],
                      )


                    ],
                  ),
                ),
              ),

              heightBox20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        AppImages.date,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),

                    widthBox10,
                    CustomText(
                      text: "Oct 28th",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF55433F),
                    )

                  ],
                ),
              ),

              heightBox10,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        AppImages.time,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),

                    widthBox10,
                    CustomText(
                      text: "10.00 AM",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF55433F),
                    )

                  ],
                ),
              ),

              heightBox10,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Reminders',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),

                    Row(
                      children: [
                        CustomText(
                          text: 'Don’t remind',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                        widthBox10,
                        Icon(Icons.arrow_forward_ios,size: 14,)

                      ],
                    )


                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: CustomText(
                  text: "Note",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF55433F),
                ),
              ),

              heightBox14,


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,),
                child: CustomText(
                  text: "“I have a meeting at 4 PM, can you take Emma to her ballet class today?”",
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF55433F),
                  textAlign: TextAlign.justify,
                ),
              ),

              heightBox14,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12,),
                child: Row(
                  children: [
                    CustomCheckbox(
                      initialValue: false,
                      onChanged: (bool value) {
                        print("Checkbox is now: $value");
                      },
                    ),
                    widthBox10,
                    CustomText(
                      text: 'Mark as completed',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    )
                  ],
                ),
              ),

              heightBox20,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  //Update
                  GestureDetector(
                    onTap: ()=> Get.to(()=> UpdateEventView()),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundColor: Color(0XFFEAEAEA).withOpacity(0.70),
                        child: ClipOval(
                          child: Image.asset(
                            AppImages.doctcheckbook,
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                            color: Color(0XFF5D4A45),
                          ),
                        ),
                      ),
                    ),
                  ),


                  widthBox14,

                  //Delete
                  Container(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundColor: Color(0XFFEAEAEA).withOpacity(0.70),
                      radius: 30,
                      child: Icon(
                        Icons.delete_forever,
                        size: 24,
                        color: Color(0XFF5D4A45),
                      ),
                    ),
                  ),

                ],
              ),

              heightBox30,


            ],
          ),
        ),
      ),

    );
  }
}
