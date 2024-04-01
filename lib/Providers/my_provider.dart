import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode mode = ThemeMode.light;

  void changeLanguage(String code) {
    languageCode = code;
    notifyListeners();
  }

  void changeMode(ThemeMode theme) {
    mode = theme;
    notifyListeners();
  }
}
