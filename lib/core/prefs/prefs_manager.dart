import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveLanguage(String language) {
    return prefs.setString(CacheConstant.keyLanguage, language);
  }

  static String? getSaveLanguage() {
    String? savedLanguage = prefs.getString(CacheConstant.keyLanguage);
    if (savedLanguage == null) {
      return null;
    } else {
      return savedLanguage;
    }
  }
}
