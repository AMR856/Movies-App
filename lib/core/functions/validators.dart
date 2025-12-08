import 'package:flutter/material.dart';
import 'package:movies_app/generated/l10n.dart';

class Validators {
  Validators._();

  static String? validateName(String? name,BuildContext context){
    if (name == null || name.trim().isEmpty) {
      return S.of(context).name_is_required;
    }
    if (name.length < 4) {
      return S.of(context).nameshouldbeatleast4chars;
    }
    return null;
  }

  static String? validateEmail(String? email,BuildContext context){
    RegExp regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return S.of(context).emailisrequired;
    }
    if(!regExp.hasMatch(email)){
      return S.of(context).e_mailBadFormat;
    }
    return null;

  }

  static String? validatePassword(String? password,BuildContext context){
    RegExp regExp =  RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (password == null || password.trim().isEmpty) {
      return S.of(context).passwordisrequired;
    }
    if(!regExp.hasMatch(password)){
      return S.of(context).weakPasswordand8length;
    }
    return null;
  }
}