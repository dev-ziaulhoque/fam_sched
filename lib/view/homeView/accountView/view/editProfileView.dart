import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/commonWidget/custom_app_bar_widget.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../commonStyle/app_colors.dart';
import '../../../../commonWidget/custom_size.dart';
import '../../../../commonWidget/custom_text_filed.dart';
import '../../../../commonWidget/custom_text_widget.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 50;

    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              //Profile Image
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundColor: AppColors.mainColor,
                      child: CircleAvatar(
                        radius: avatarRadius - 3,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687',
                        ) as ImageProvider,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              heightBox20,

              CustomText(
                text: 'Name',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0XFF4F4F4F),
              ),
              heightBox10,

              CustomTextField(
                  hintText: 'Emma Johnson',
                  showObscure: false
              ),
              heightBox20,

              CustomText(
                text: 'Relation',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0XFF4F4F4F),
              ),
              heightBox10,

              CustomTextField(
                  hintText: 'Mother',
                  showObscure: false
              ),


              heightBox20,


              CustomText(
                text: 'Email',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0XFF4F4F4F),
              ),
              heightBox10,

              CustomTextField(
                  hintText: 'abc@gmail.com',
                  showObscure: false
              ),


              heightBox30,

              CustomButtonWidget(
                  btnText: 'Save Changes',
                  onTap: (){},
                  iconWant: false
              ),


              heightBox20,

            ],
          ),
        ),
      ),
    );
  }
}
