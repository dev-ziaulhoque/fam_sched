import 'package:flutter/material.dart';
import 'package:gt_tbb/commonStyle/app_colors.dart';
import 'package:gt_tbb/commonStyle/app_images.dart';
import 'package:gt_tbb/commonWidget/custom_text_widget.dart';
import 'accountView/view/accountView.dart';
import 'addEventView/view/addEventView.dart';
import 'calenderView/view/calenderView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    CalendarScreen(),
    AddEventScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[selectedIndex],

      // Floating Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF55433F),
        elevation: 5,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            selectedIndex = 1;
          });
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom Navigation with Decoration
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: Colors.transparent,
          elevation: 0,
          child: SafeArea(
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _buildNavItem(AppImages.calender, "Calendar", 0),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: _buildNavItem(AppImages.account, "Account", 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ Fixed Nav Item (No Overflow)
  Widget _buildNavItem(String assetPath, String label, int index) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              width: 24,
              height: 24,
              color: isSelected ? AppColors.mainColor : Colors.grey,
            ),
            const SizedBox(height: 2),
            CustomText(
              text: label,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ?  AppColors.mainColor : AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
