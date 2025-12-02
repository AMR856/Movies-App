import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';

class CustomButtonDetails extends StatelessWidget {
  const CustomButtonDetails({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.w,
      padding: REdgeInsets.symmetric(
        horizontal: 15,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 14,
        children: [
          Icon(
            icon,
            color: ColorManager.yellow,
            size: 25,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: AppSize.s24.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
