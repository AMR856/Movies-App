// lib/core/routes_manager/routes_manager.dart

import 'package:flutter/material.dart';
import 'package:movies_app/features/forget_password/forget_password.dart';
import 'package:movies_app/features/home/home_tab.dart';

import 'package:movies_app/features/login/login.dart';
import 'package:movies_app/features/onboarding/onboarding.dart';
import 'package:movies_app/features/register/register.dart';
import 'package:movies_app/features/splash/splash_screen.dart';
// 💡 يجب عليك التأكد من أن هذا المسار صحيح


abstract class RoutesManager {

  static const String splashScreen = 'splashScreen';
  static const String login = 'login';
  static const String register = 'register';
  static const String onboarding = 'onboarding';
  static const String home = 'home';
  static const String forgetpassword = 'forgetpassword';



  //---------------------------------------------------------------------------
  static Map<String, WidgetBuilder> Routes() {
    return {
      splashScreen: (context) =>  const SplashScreen(), // 💡 يُفضل إضافة const
      login: (context) =>  const Login(),
      register: (context) =>  const Register(),
      onboarding: (context) =>  const OnboardingView(),
      home: (context) =>  const HomeTab(),
      forgetpassword: (context) =>  const ForgetPassword()

    };

  }
}