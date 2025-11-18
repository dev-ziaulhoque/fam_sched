import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/commonWidget/commonAppbar.dart';
import 'package:gt_tbb/commonWidget/custom_size.dart';
import 'package:gt_tbb/commonWidget/custom_text_widget.dart';
import 'package:gt_tbb/view/homeView/accountView/widget/notificationDialogView.dart';
import '../../../../commonStyle/app_colors.dart';
import '../widget/customNotification.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  // Sample notification data
  final List<Map<String, String>> todayNotifications = const [
    {
      'message': 'Gymnastics Class has been added for You on Wednesday at 4:00 PM.',
      'time': '4:30 PM',
      'timeAgo': '30 Min Ago',
    },
    {
      'message': 'Math Class reminder for You at 3:00 PM.',
      'time': '3:00 PM',
      'timeAgo': '2 Hours Ago',
    },

    {
      'message': 'Gymnastics Class has been added for You on Wednesday at 4:00 PM.',
      'time': '4:30 PM',
      'timeAgo': '30 Min Ago',
    },
    {
      'message': 'Math Class reminder for You at 3:00 PM.',
      'time': '3:00 PM',
      'timeAgo': '2 Hours Ago',
    },
    {
      'message': 'Gymnastics Class has been added for You on Wednesday at 4:00 PM.',
      'time': '4:30 PM',
      'timeAgo': '30 Min Ago',
    },
    {
      'message': 'Math Class reminder for You at 3:00 PM.',
      'time': '3:00 PM',
      'timeAgo': '2 Hours Ago',
    },
    {
      'message': 'Gymnastics Class has been added for You on Wednesday at 4:00 PM.',
      'time': '4:30 PM',
      'timeAgo': '30 Min Ago',
    },
    {
      'message': 'Math Class reminder for You at 3:00 PM.',
      'time': '3:00 PM',
      'timeAgo': '2 Hours Ago',
    },
    {
      'message': 'Gymnastics Class has been added for You on Wednesday at 4:00 PM.',
      'time': '4:30 PM',
      'timeAgo': '30 Min Ago',
    },
    {
      'message': 'Math Class reminder for You at 3:00 PM.',
      'time': '3:00 PM',
      'timeAgo': '2 Hours Ago',
    },




  ];

  final List<Map<String, String>> yesterdayNotifications = const [
    {
      'message': 'Swimming Class has been added for You on Tuesday at 5:00 PM.',
      'time': '5:00 PM',
      'timeAgo': '1 Day Ago',
    },
    {
      'message': 'Swimming Class has been added for You on Tuesday at 5:00 PM.',
      'time': '5:00 PM',
      'timeAgo': '1 Day Ago',
    },

    {
      'message': 'Swimming Class has been added for You on Tuesday at 5:00 PM.',
      'time': '5:00 PM',
      'timeAgo': '1 Day Ago',
    },
    {
      'message': 'Swimming Class has been added for You on Tuesday at 5:00 PM.',
      'time': '5:00 PM',
      'timeAgo': '1 Day Ago',
    },
    {
      'message': 'Swimming Class has been added for You on Tuesday at 5:00 PM.',
      'time': '5:00 PM',
      'timeAgo': '1 Day Ago',
    },
    {
      'message': 'Swimming Class has been added for You on Tuesday at 5:00 PM.',
      'time': '5:00 PM',
      'timeAgo': '1 Day Ago',
    },






  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: 'Notification'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          children: [
            // Today Section
            CustomText(
              text: 'Today',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
              textAlign: TextAlign.start,
            ),
            heightBox10,
            ...todayNotifications.map((item) {
              return Column(

                children: [
                  CustomNotification(
                    message: item['message']!,
                    time: item['time']!,
                    timeAgo: item['timeAgo']!,
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => NotificationDialogView(
                          title: 'You’ve Got a New Event',
                          subTitle: "I have a meeting at 4pm, can you take Emma to her Gymnastics class today?",
                          onAccept: ()=> Navigator.pop(context),
                          onDeny: ()=>  Navigator.pop(context),
                        ),
                      );
                    },
                  ),
                  Divider(thickness: 0.5),
                ],
              );
            }).toList(),

            SizedBox(height: 20.h),

            // Yesterday Section
            CustomText(
              text: 'Yesterday',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor,
              textAlign: TextAlign.start,
            ),
            heightBox10,
            ...yesterdayNotifications.map((item) {
              return Column(
                children: [
                  CustomNotification(
                    message: item['message']!,
                    time: item['time']!,
                    timeAgo: item['timeAgo']!,
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => NotificationDialogView(
                          title: 'You’ve Got a New Event',
                          subTitle: "I have a meeting at 4pm, can you take Emma to her Gymnastics class today?",
                          onAccept: ()=> Navigator.pop(context),
                          onDeny: ()=>  Navigator.pop(context),
                        ),
                      );
                    },
                  ),
                  Divider(thickness: 0.5),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
