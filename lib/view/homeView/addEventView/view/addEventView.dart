import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gt_tbb/commonStyle/app_images.dart';
import 'package:gt_tbb/commonWidget/commonAppbar.dart';
import 'package:gt_tbb/commonWidget/custom_button_widget.dart';
import 'package:gt_tbb/commonWidget/custom_text_filed.dart';
import 'package:gt_tbb/view/homeView/accountView/view/notificationView.dart';
import 'package:intl/intl.dart';
import '../../../../commonStyle/app_colors.dart';
import '../../../../commonWidget/customCheckBox_widget.dart';
import '../../../../commonWidget/customDropDownWidget.dart';
import '../../../../commonWidget/custom_size.dart';
import '../../../../commonWidget/custom_text_widget.dart';
import '../widget/customDropdown.dart';
import '../widget/customEventTextField.dart';
import '../widget/openAssignSheetWidget.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {


  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _assignController = TextEditingController();
  final TextEditingController _includeSchedule = TextEditingController();



  //Date Picker
  Future<void> _openDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  //Time Picker

  void _showCupertinoTimePicker() {
    DateTime now = DateTime.now();
    DateTime selectedTime = now;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 250.h,
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            children: [
              // Done Button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    String formattedTime =
                    DateFormat('h:mm a').format(selectedTime);
                    setState(() {
                      _timeController.text = formattedTime;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Cupertino Time Picker
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: now,
                  use24hFormat: false,
                  onDateTimeChanged: (DateTime newTime) {
                    selectedTime = newTime;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //Open Assign Sheet

  final List<Map<String, dynamic>> _members = [
    {"name": "John", "checked": false},
    {"name": "Emma", "checked": false},
    {"name": "Noah", "checked": false},
    {"name": "Sophia", "checked": false},
  ];

  //Assign Sheet
  void _openAssignSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AssignSheet(
          members: _members,
          onDone: (selectedNames) {
            setState(() {
              _assignController.text =
              selectedNames.isEmpty ? 'None' : selectedNames.join(', ');
            });
          },
        );
      },
    );
  }

  //Include Schedule
  void _include() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return AssignSheet(
          members: _members,
          onDone: (selectedNames) {
            setState(() {
              _includeSchedule.text =
              selectedNames.isEmpty ? 'None' : selectedNames.join(', ');
            });
          },
        );
      },
    );
  }

  String? selectedValue;

  void _showDropdown() async {
    final selected = await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (context) => CustomDropdown(
        items: ['5 minutes before ', '10 hours ago ', '1 hour ago', '2 weeks Before','Cancel'],
        onItemSelected: (value) {
          Navigator.pop(context, value);
        },
      ),
    );

    if (selected != null) {
      setState(() {
        selectedValue = selected;
      });
    }
  }

  String? selectedRecurring;

  void _recurringDropdown() async {
    final selected = await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (context) => CustomDropdown(
        items: ['Weekly ', 'Monthly', 'Daily','Cancel'],
        onItemSelected: (value) {
          Navigator.pop(context, value);
        },
      ),
    );

    if (selected != null) {
      setState(() {
        selectedRecurring = selected;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        title: 'Add Event',
        rightIcon: AppImages.notification,
        onRightIconTap: () => Get.to(() => const NotificationView()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header Text
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: 'Edit New Event',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF55433F),
                    ),
                    heightBox8,
                    CustomText(
                      text: 'Plan and organize your day easily',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF4F4F4F),
                    ),
                  ],
                ),
              ),

              heightBox20,

              // 🔹 Event Title
              _buildInputLabel(
                icon: AppImages.event,
                label: 'Event Title',
              ),
              heightBox10,
               CustomEventTextField(
                hintText: 'Ballet Class',
                showObscure: false,
              ),

              heightBox20,

              // 🔹 Date & Time Row
              Row(
                children: [
                  // Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputLabel(
                          icon: AppImages.date,
                          label: 'Date',
                        ),
                        heightBox10,
                        CustomEventTextField(
                          controller: _dateController,
                          hintText: '12 Oct 2025',
                          showObscure: false,
                          postfixIcon: Icons.calendar_month_sharp,
                          onPostfixTap: _openDatePicker,
                        ),
                      ],
                    ),
                  ),

                  widthBox20,

                  // Time
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputLabel(
                          icon: AppImages.time,
                          label: 'Time',
                        ),
                        heightBox10,

                        CustomEventTextField(
                           controller: _timeController,
                          hintText: '4:00 PM',
                          showObscure: false,
                          postfixIcon: Icons.timer,
                           onPostfixTap: _showCupertinoTimePicker,
                        ),


                      ],
                    ),
                  ),
                ],
              ),
              heightBox20,

              CustomEventTextField(
                controller: _assignController,
                hintText: 'Assign to',
                showObscure: false,
                postfixIcon: Icons.keyboard_arrow_down,
                onPostfixTap: _openAssignSheet,
              ),
              heightBox20,

              CustomText(
                text: 'Include in Schedule',
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0XFF55433F),
              ),
              heightBox10,
              CustomEventTextField(
                controller: _includeSchedule,
                  hintText: 'People who can See the event',
                  showObscure: false,
                postfixIcon: Icons.keyboard_arrow_down,
                onPostfixTap: _include,
              ),
              heightBox20,


              CustomEventTextField(
                hintText: selectedValue ?? 'Set Reminder',
                showObscure: false,
                prefixIcon: Icons.alarm,
                postfixIcon: Icons.keyboard_arrow_down,
                readOnly: true,
                onPostfixTap:_showDropdown,
              ),



              heightBox20,

              CustomEventTextField(
                hintText: selectedRecurring ?? 'Recurring',
                showObscure: false,
                prefixIcon: Icons.refresh,
                postfixIcon: Icons.keyboard_arrow_down,
                readOnly: true,
                onPostfixTap: _recurringDropdown,
              ),

              heightBox20,
              Row(
                children: [

                  CustomCheckbox(
                    initialValue: false,
                    onChanged: (bool value) {
                      print("Checkbox is now: $value");
                    },
                  ),
                  widthBox10,
                  CustomText(
                    text: 'Assign this event to me as well',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF5C5C5C),
                  )
                ],
              ),

              heightBox20,
              Row(
                children: [
                  Image.asset(
                    AppImages.note,
                    height: 20.h,
                    width: 20.w,
                  ),
                  widthBox10,
                  CustomText(
                    text: 'Note',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF55433F),
                  ),
                ],
              ),
              heightBox10,
              CustomEventTextField(
                  hintText: '“I have a meeting at 4pm, can you take Emma to her ballet class today?”',
                  maxLines: 5,
                  showObscure: false,
              ),


              heightBox20,

              CustomButtonWidget(
                  btnText: 'Save',
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

  // 🔹 Reusable Input Label Builder
  Widget _buildInputLabel({
    required String icon,
    required String label,
  }) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 20.h,
          width: 20.w,
        ),
        widthBox10,
        CustomText(
          text: label,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0XFF55433F),
        ),
      ],
    );
  }
}
