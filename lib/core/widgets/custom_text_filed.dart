import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.onChanged,
    required this.icon,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      style: TextStyle(color: ColorManager.white, fontSize: AppSize.s16),
      cursorColor: ColorManager.white,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        fillColor: ColorManager.grey,
        filled: true,
        prefixIcon: Icon(
          icon,
          color: ColorManager.white,
          size: 30.sp,
        ),
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: ColorManager.white, fontSize: AppSize.s16),
        labelStyle: TextStyle(color: ColorManager.white, fontSize: AppSize.s16),
      ),
    );
  }
}
