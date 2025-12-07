import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/core/resources/color_manager.dart';

abstract class Toasts{
  static void showToast(Color toastColor, String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: toastColor,
      textColor: ColorManager.white,
      fontSize: 16.0,
    );
  }
}