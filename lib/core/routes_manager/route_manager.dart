import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/features/main_layout/main_layout.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/features/movie_details/presentation/movie_details.dart';
import 'package:movies_app/features/update_profile/presentation/cubit/avatar_cubit.dart';
import 'package:movies_app/features/update_profile/presentation/cubit/update_profile_cubit.dart';
import 'package:movies_app/features/update_profile/presentation/update_profile.dart';

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
        return MaterialPageRoute(
          builder: (_) => MovieDetails(
            moviesEntity: settings.arguments as MoviesEntity,
          ),
        );
      case RoutesManager.updateProfile:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => UpdateProfileCubit(GetIt.I())),
                BlocProvider(create: (_) => AvatarCubit()),
              ],
              child: UpdateProfile(),
          ),
          settings: settings,
        );

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
