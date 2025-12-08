import 'package:flutter/material.dart';
import 'package:movies_app/core/prefs/prefs_manager.dart';

class ConfigProvider extends ChangeNotifier {
  String currentLanguage = PrefsManager.getSaveLanguage() ?? 'en';
  void changeAppLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    PrefsManager.saveLanguage(newLanguage);
    notifyListeners();
  }

  final List<String> genresAr = [
    'أكشن',
    'مغامرات',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Musical',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Sport',
    'Thriller',
    'War',
    'Western',
  ];
}
