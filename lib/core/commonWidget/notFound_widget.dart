// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class NotFoundWidget extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const NotFoundWidget({
    Key? key,
    this.buttonText = "Retry",
    this.onButtonPressed,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 50,
            color: Colors.grey,
          ),
          SizedBox(height: 6),
          CustomText(
            text: message,
            textAlign: TextAlign.center,
            fontSize: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
