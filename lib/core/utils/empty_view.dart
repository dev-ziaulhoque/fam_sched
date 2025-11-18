
import 'package:flutter/material.dart';

import '../commonWidget/custom_text_widget.dart';

class EmptyView extends StatelessWidget {
  final String? message;
  final IconData? icon;
  final double? iconSize;
  const EmptyView({super.key, this.message, this.icon, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon ?? Icons.inbox_outlined,
            size: iconSize ?? 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          CustomText(
            text: message ?? 'Data Not Found',
            color: Colors.grey[600]!,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}