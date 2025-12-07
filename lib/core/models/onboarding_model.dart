// lib/presentation/onboarding/onboarding_model.dart
import 'package:movies_app/core/resources/assets_manager.dart';

class OnboardingModel {
  final String imagePath;
  final String title;
  final String description;

  OnboardingModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    imagePath: ImageAssets.moviesPosters,
    title: 'Find Your Next Favorite Movie Here',
    description: 'Get access to a huge library of movies to suit all tastes. You will surely like it.',
  ),
  OnboardingModel(
    imagePath: ImageAssets.heroes,
    title: 'Discover Movies',
    description: 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
  ),
  OnboardingModel(
    imagePath: ImageAssets.theGodFather,
    title: 'Explore All Genres',
    description: 'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
  ),
  OnboardingModel(
    imagePath: ImageAssets.badBoys,
    title: 'Create Watchlists',
    description: 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
  ),
  OnboardingModel(
    imagePath: ImageAssets.strong,
    title: 'Rate, Review, and Learn',
    description: 'Share your thoughts on the movies you’ve watched. Dive deep into film details and help others discover great movies with your reviews.',
  ),
  OnboardingModel(
    imagePath: ImageAssets.samMendes,
    title: 'Start Watching Now',
    description: '',
  ),
];