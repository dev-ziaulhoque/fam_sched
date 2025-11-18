import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final ValueChanged<String> onItemSelected;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54, // slight dim background
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Close Icon
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),

              // 🔹 Dropdown Items
              ...items.map((item) {
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    // "Cancel" item will also close popup
                    if (item.toLowerCase().contains('cancel')) {
                      Navigator.pop(context);
                    } else {
                      onItemSelected(item);
                    }
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
