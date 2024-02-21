import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _lightTheme = ThemeData.light();
  ThemeData _darkTheme = ThemeData.dark();
  ThemeData? _currentTheme;

  ThemeProvider({bool isDarkMode = false}) {
    _currentTheme = isDarkMode ? _darkTheme : _lightTheme;
  }

  ThemeData? get currentTheme => _currentTheme;

  bool get isDarkMode => _currentTheme == _darkTheme;

  set isDarkMode(bool value) {
    _currentTheme = value ? _darkTheme : _lightTheme;
    notifyListeners();
  }

  void setLightMode() {
    isDarkMode = false;
  }

  void setDarkMode() {
    isDarkMode = true;
  }
}
