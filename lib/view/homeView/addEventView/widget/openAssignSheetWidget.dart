import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gt_tbb/core/commonWidget/custom_button_widget.dart';

import '../../../../core/commonWidget/customCheckBox_widget.dart';

class AssignSheet extends StatefulWidget {
  final List<Map<String, dynamic>> members;
  final Function(List<String> selectedNames) onDone;

  const AssignSheet({
    Key? key,
    required this.members,
    required this.onDone,
  }) : super(key: key);

  @override
  State<AssignSheet> createState() => _AssignSheetState();
}

class _AssignSheetState extends State<AssignSheet> {
  late List<Map<String, dynamic>> _localMembers;

  @override
  void initState() {
    super.initState();
    // Create a local copy of members to edit inside sheet
    _localMembers = widget.members.map((e) => Map.of(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerRight,
      widthFactor: 0.85,
      child: Container(
        height: 500.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(-2, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Assign to",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            const Divider(),

            SizedBox(height: 10.h),

            // List of checkboxes
            Expanded(
              child: ListView.builder(
                itemCount: _localMembers.length,
                itemBuilder: (context, index) {
                  final member = _localMembers[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(member["name"], style: const TextStyle(fontSize: 16)),
                        CustomCheckbox(
                          initialValue: member["checked"],
                          onChanged: (value) {
                            setState(() {
                              _localMembers[index]["checked"] = value;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20.h),

            CustomButtonWidget(btnText: 'Done',
                onTap: () {
                  final selected = _localMembers
                      .where((m) => m["checked"] == true)
                      .map((m) => m["name"] as String)
                      .toList();

                  widget.onDone(selected);
                  Navigator.pop(context);
                },
                iconWant: false),

            SizedBox(height: 40.h),

          ],
        ),
      ),
    );
  }
}
