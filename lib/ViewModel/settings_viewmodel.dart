// settings_viewmodel.dart
import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  Color _foregroundColor = Colors.black;
  Color _backgroundColor = Colors.white;

  Color get foregroundColor => _foregroundColor;
  Color get backgroundColor => _backgroundColor;

  void changeForegroundColor(Color color) {
    _foregroundColor = color;
    notifyListeners();
  }

  void changeBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }
}
