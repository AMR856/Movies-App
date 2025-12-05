import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';

class CountWidget extends StatelessWidget {
  final String text;
  final int num;
  CountWidget({super.key, required this.text, required this.num});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$num',
          style: TextStyle(
            color: ColorManager.white,
            fontSize: FontSize.s36,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSize.s14.h),
        Text(
          text,
          style: TextStyle(
            color: ColorManager.white,
            fontSize: FontSize.s20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
