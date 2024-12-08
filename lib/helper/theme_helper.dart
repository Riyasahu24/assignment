import 'package:shared_preferences/shared_preferences.dart';

class ThemeHelper {
   static Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('theme') ?? false;
  }

  static Future<void> setDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('theme', isDarkMode);
  }
}