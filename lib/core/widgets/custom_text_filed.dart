import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.controller,
    required this.icon,
    this.label,
    this.hint,
    this.onChanged,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      style: TextStyle(
        color: ColorManager.white,
        fontSize: AppSize.s16,
      ),
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
        hintStyle: TextStyle(
          color: ColorManager.white,
          fontSize: AppSize.s16,
        ),
        labelStyle: TextStyle(
          color: ColorManager.white,
          fontSize: AppSize.s16,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
