import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gt_tbb/core/commonWidget/custom_app_bar_widget.dart';

import 'package:gt_tbb/core/commonWidget/custom_text_widget.dart';
import 'package:gt_tbb/view/homeView/calenderView/view/tomorrowView.dart';
import 'package:gt_tbb/view/homeView/calenderView/view/upcommingView.dart';
import 'package:gt_tbb/view/homeView/calenderView/widget/pendingWidget.dart';
import 'package:gt_tbb/view/homeView/calenderView/widget/upcomingWidget.dart';
import '../../../../core/commonStyle/app_colors.dart';
import '../../../../core/commonStyle/app_images.dart';
import '../../../../core/commonWidget/custom_size.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pendingItems = [
      {'title': 'Ballet Class', 'timer': '4:30 PM - 5:30 PM'},
      {'title': 'Piano Lesson', 'timer': '5:45 PM - 6:30 PM'},
      {'title': 'Math Tutoring', 'timer': '6:45 PM - 7:30 PM'},
    ];
    final List<Map<String, String>> upComingItems = [
      {'title': 'Family Dinner', 'timer': '4:30 PM - 5:30 PM'},
      {'title': 'Family Dinner', 'timer': '5:45 PM - 6:30 PM'},
      {'title': 'Family Dinner', 'timer': '6:45 PM - 7:30 PM'},
    ];

    return Scaffold(
      appBar: CustomAppBar(title: 'Today'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // 🔹 Search Field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Events by name',
                  hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide:
                    const BorderSide(color: Color(0XFFE8E8E8), width: 1),
                  ),
                ),
              ),

              heightBox10,

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                        color: Colors.transparent,
                        border: Border.all(
                            color: Color(0XFFE8E8E8,),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'Today',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ),

                  widthBox14,

                  Expanded(
                    child: GestureDetector(
                      onTap: ()=> Get.to(TomorrowScreen()),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Color(0XFFE8E8E8),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Tomorrow',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  widthBox14,

                  Expanded(
                    child: GestureDetector(
                      onTap: ()=> Get.to(UpComingScreen()),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Color(0XFFE8E8E8),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Upcoming',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 16.h),

              // 🔹 Content Scroll
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      // // Child Section
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 20,
                      //       height: 20,
                      //       decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         border: Border.all(
                      //             color: const Color(0XFF922424), width: 2),
                      //       ),
                      //       child: Center(
                      //         child: Container(
                      //           width: 10,
                      //           height: 10,
                      //           decoration: const BoxDecoration(
                      //             color: Color(0XFF922424),
                      //             shape: BoxShape.circle,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 10),
                      //     CustomText(
                      //       text: "Child",
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.w700,
                      //       color: AppColors.textColor,
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 16),

                      // Child Pending Items

                      Column(
                        children: pendingItems.map((item) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 14.h),
                            child: PendingWidget(
                              title: item['title']!,
                              timer: item['timer']!,
                              onTap: () => print('Tapped ${item['title']}'),
                            ),
                          );
                        }).toList(),
                      ),


                      // // Family Section
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 20,
                      //       height: 20,
                      //       decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         border: Border.all(
                      //             color: const Color(0XFF8A38F5), width: 2),
                      //       ),
                      //       child: Center(
                      //         child: Container(
                      //           width: 10,
                      //           height: 10,
                      //           decoration: const BoxDecoration(
                      //             color: Color(0XFF8A38F5),
                      //             shape: BoxShape.circle,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 10),
                      //     CustomText(
                      //       text: "Family",
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.w700,
                      //       color: AppColors.textColor,
                      //     ),
                      //   ],
                      // ),


                      const SizedBox(height: 10),

                      // Family Pending Items
                      Column(
                        children: upComingItems.map((item) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 14.h),
                            child: UpComingWidget(
                              title: item['title']!,
                              timer: item['timer']!,
                              onTap: () => print('Tapped ${item['title']}'),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
