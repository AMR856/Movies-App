import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/font_manager.dart';

class TabItem extends StatelessWidget {
  final Color selectedTapBgColor;
  final Color selectedTapFgColor;
  final Color unSelectedTapBgColor;
  final Color unSelectedTapFgColor;
  final String label;
  const TabItem({
    super.key,
    required this.selectedTapBgColor,
    required this.selectedTapFgColor,
    required this.unSelectedTapBgColor,
    required this.unSelectedTapFgColor,
    required this.isSelected,
    required this.label,
  });

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? selectedTapBgColor : unSelectedTapBgColor,
        borderRadius: BorderRadius.circular(16.r),
        border: BoxBorder.all(color: selectedTapBgColor),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: FontSize.s20.sp,
          fontWeight: FontWeight.bold,
          color: isSelected ? selectedTapFgColor : unSelectedTapFgColor,
        ),
      ),
    );
  }
}
