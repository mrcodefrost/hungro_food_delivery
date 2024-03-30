import 'package:flutter/material.dart';
import 'package:hungro_food_delivery/themes/dark_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // to ensure prefThemeData is called
  ThemeProvider() {
    // Call prefThemeData when ThemeProvider is initialized
    prefThemeData();
  }

  // to set the default value of theme
  Future<void> toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_themeData == lightMode) {
      themeData = darkMode;
      prefs.setBool('isPrefDarkTheme', true);
    } else {
      themeData = lightMode;
      prefs.setBool('isPrefDarkTheme', false);
    }
  }

  // to fetch the previously set theme or handle on first use
  void prefThemeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isPrefDarkTheme') != null) {
      themeData = prefs.getBool('isPrefDarkTheme')! ? darkMode : lightMode;
    } else {
      themeData = lightMode;
    }
  }
}
