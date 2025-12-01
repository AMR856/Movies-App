import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/font_manager.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.selectedTapBgColor,
    required this.selectedTapFgColor,
    required this.unSelectedTapBgColor,
    required this.unSelectedTapFgColor,

    required this.isSelected,
  });
  final Color selectedTapBgColor;
  final Color selectedTapFgColor;
  final Color unSelectedTapBgColor;
  final Color unSelectedTapFgColor;

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? selectedTapBgColor : unSelectedTapBgColor,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: selectedTapBgColor),
      ),
      child: Text(
        'Adventure',
        style: TextStyle(
          fontSize: FontSize.s20.sp,
          fontWeight: FontWeight.bold,
          color: isSelected ? selectedTapFgColor : unSelectedTapFgColor,
        ),
      ),
    );
  }
}
