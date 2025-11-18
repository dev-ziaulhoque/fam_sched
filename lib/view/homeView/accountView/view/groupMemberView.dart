import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../commonStyle/app_images.dart';
import '../widget/alertDialog.dart';
import 'addFamillyMemberView.dart';
import '../widget/singleGroupMember_widget.dart';
import '../../../../commonStyle/app_colors.dart';
import '../../../../commonWidget/custom_app_bar_widget.dart';
import '../../../../commonWidget/custom_button_widget.dart';
import '../../../../commonWidget/custom_size.dart';
import '../../../../commonWidget/custom_text_widget.dart';

class GroupMemberView extends StatelessWidget {
  GroupMemberView({super.key});

  // ✅ Dummy dynamic list
  final List<Map<String, String>> groupMembers = [
    {
      "name": "Sarah Mitchell",
      "email": "sarahmit@gmail.com",
      "image":
      "https://thumbs.dreamstime.com/b/profile-picture-smiling-indian-young-businesswoman-look-camera-posing-workplace-headshot-portrait-happy-millennial-ethnic-190959731.jpg"
    },
    {
      "name": "David Warner",
      "email": "davidwarner@example.com",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkWExFgZCIM5VfEArRaiDj5AAU2QvjX4Ug_A&usqp=CAU"
    },
    {
      "name": "Sophia Lee",
      "email": "sophia.lee@gmail.com",
      "image":
      "https://randomuser.me/api/portraits/women/65.jpg"
    },
    {
      "name": "Sarah Mitchell",
      "email": "sarahmit@gmail.com",
      "image":
      "https://thumbs.dreamstime.com/b/profile-picture-smiling-indian-young-businesswoman-look-camera-posing-workplace-headshot-portrait-happy-millennial-ethnic-190959731.jpg"
    },
    {
      "name": "David Warner",
      "email": "davidwarner@example.com",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkWExFgZCIM5VfEArRaiDj5AAU2QvjX4Ug_A&usqp=CAU"
    },
    {
      "name": "Sophia Lee",
      "email": "sophia.lee@gmail.com",
      "image":
      "https://randomuser.me/api/portraits/women/65.jpg"
    },
    {
      "name": "Sarah Mitchell",
      "email": "sarahmit@gmail.com",
      "image":
      "https://thumbs.dreamstime.com/b/profile-picture-smiling-indian-young-businesswoman-look-camera-posing-workplace-headshot-portrait-happy-millennial-ethnic-190959731.jpg"
    },
    {
      "name": "David Warner",
      "email": "davidwarner@example.com",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkWExFgZCIM5VfEArRaiDj5AAU2QvjX4Ug_A&usqp=CAU"
    },
    {
      "name": "Sophia Lee",
      "email": "sophia.lee@gmail.com",
      "image":
      "https://randomuser.me/api/portraits/women/65.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Group Member'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Manage Members',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
              heightBox8,
              CustomText(
                text: 'View and manage who can see your events.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0XFF676769),
              ),
              heightBox20,

              // ✅ Dynamic ListView of Members
              Expanded(
                child: ListView.separated(
                  itemCount: groupMembers.length,
                  separatorBuilder: (_, __) => heightBox10,
                  itemBuilder: (context, index) {
                    final member = groupMembers[index];
                    return SingleGroupMember(
                      imageUrl: member["image"]!,
                      name: member["name"]!,
                      email: member["email"]!,
                      onDelete: (){
                        showDialog(
                          context: context,
                          builder: (context) => ProfileAlertDialog(
                            imagePath: AppImages.deleteAccount,
                            subTitle: "Are you sure you want to delete?",
                            onAccept: ()=> print('Hello'),
                            onDeny: ()=> print('Hello'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              heightBox20,
              CustomButtonWidget(
                btnText: 'Add Group Members',
                onTap: () => Get.to(() => const AddFamilyMemberView()),
                iconWant: false,
              ),
              heightBox20,
            ],
          ),
        ),
      ),
    );
  }
}
