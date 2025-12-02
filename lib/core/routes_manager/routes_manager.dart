import 'package:flutter/material.dart';
import 'package:movies_app/features/authentication/forget_password/forget_password.dart';
import 'package:movies_app/features/authentication/login/login.dart';
import 'package:movies_app/features/authentication/register/register.dart';
import 'package:movies_app/features/onboarding/onboarding.dart';
import 'package:movies_app/features/splash/splash_screen.dart';


abstract class RoutesManager {

  static const String splashScreen = 'splashScreen';
  static const String login = './login';
  static const String register = './register';
  static const String onboarding = './onboarding';
  static const String forgetPassword = './forget-password';




  //---------------------------------------------------------------------------
  static Map<String, WidgetBuilder> routes() {
    return {
      splashScreen: (context) =>  SplashScreen(),
      login: (context) =>  Login(),
      register: (context) =>  Register(),
      onboarding: (context) =>  OnboardingView(),
      forgetPassword: (context) =>  ForgetPassword(),
    };

    }
  }
