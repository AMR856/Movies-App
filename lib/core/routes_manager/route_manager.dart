import 'package:flutter/material.dart';
import 'package:movies_app/features/main_layout/main_layout.dart';
import 'package:movies_app/features/movie_details/movie_details.dart';
import 'package:movies_app/features/update_profile/update_profile.dart';

abstract class RoutesManager {
  static const String mainLayout = "./main-layout";
  static const String movieDetails = "/movie-details";
  static const String updateProfile = "/update-profile";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case RoutesManager.movieDetails:
        return MaterialPageRoute(builder: (_) => MovieDetails());
      case RoutesManager.updateProfile:
        return MaterialPageRoute(builder: (_) => UpdateProfile());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
