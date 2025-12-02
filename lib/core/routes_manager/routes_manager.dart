import 'package:flutter/material.dart';
import 'package:movies_app/features/authentication/forget_password/forget_password.dart';
import 'package:movies_app/features/authentication/login/login.dart';
import 'package:movies_app/features/authentication/register/register.dart';
import 'package:movies_app/features/main_layout/main_layout.dart';
import 'package:movies_app/features/movie_details/movie_details.dart';
import 'package:movies_app/features/onboarding/onboarding.dart';
import 'package:movies_app/features/splash/splash_screen.dart';
import 'package:movies_app/features/update_profile/update_profile.dart';

abstract class RoutesManager {
  static const String splashScreen = '/splashScreen';
  static const String login = '/login';
  static const String register = '/register';
  static const String onboarding = '/onboarding';
  static const String forgetPassword = '/forget-password';
  static const String mainLayout = "./main-layout";
  static const String movieDetails = "/movie-details";
  static const String updateProfile = "/update-profile";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutesManager.login:
        return MaterialPageRoute(builder: (_) => const Login());

      case RoutesManager.register:
        return MaterialPageRoute(builder: (_) => const Register());

      case RoutesManager.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());

      case RoutesManager.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      case RoutesManager.mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case RoutesManager.movieDetails:
        return MaterialPageRoute(builder: (_) => MovieDetails());
      case RoutesManager.updateProfile:
        return MaterialPageRoute(builder: (_) => UpdateProfile());

      default:
        return _unDefinedRoute();
    }
  }

  static Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
