import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/routes.dart';
import 'package:movies_app/feature/main_layout/main_layout.dart';
import 'package:movies_app/feature/movie_details/movie_details.dart';
import 'package:movies_app/feature/update_profile/update_profile.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case Routes.movieDetailsRoute:
        return MaterialPageRoute(builder: (_) => MovieDetails());
      case Routes.updateProfileRoute:
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
