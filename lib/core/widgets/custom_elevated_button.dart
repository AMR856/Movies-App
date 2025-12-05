import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/font_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.bgColor,
    this.fgColor,
    this.onPressed,
    required this.text,
    this.isIcon = false,
    required this.horizontal,
    this.fontSize = FontSize.s20,
    this.fontWeight = FontWeight.bold,
  });
  final Color? bgColor;
  final Color? fgColor;
  final String text;
  final bool isIcon;
  final void Function()? onPressed;
  final double horizontal;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15.r),
        ),
        padding: REdgeInsets.symmetric(horizontal: horizontal, vertical: 15),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: fgColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),

          Visibility(
            visible: isIcon,
            child: Padding(
              padding: REdgeInsets.only(left: 10),
              child: Icon(Icons.exit_to_app, color: fgColor),
            ),
          ),
        ],
      ),
    );
  }
}
