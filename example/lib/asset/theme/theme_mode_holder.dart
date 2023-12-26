import 'package:flutter/material.dart';

final class ThemeModeHolder extends ChangeNotifier {
  ThemeMode _themeMode;

  ThemeModeHolder({
    required ThemeMode themeMode,
  }) : _themeMode = themeMode;

  ThemeMode get themeMode => _themeMode;

  void setLightTheme() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDarkTheme() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setSystemTheme() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}
