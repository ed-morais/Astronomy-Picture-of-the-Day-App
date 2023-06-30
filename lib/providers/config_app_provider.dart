import 'package:flutter/material.dart';

class ConfigAppProvider with ChangeNotifier {
  double _rate = 0.0;
  bool _isDark = true;
  Color _primaryColor = Colors.purple.shade800;

  double get rate => _rate;
  bool get isDark => _isDark;
  Color get primaryColor => _primaryColor;

  void changeRate(double newRate) {
    _rate = newRate;
    notifyListeners();
  }

  void changeTheme(value) {
    _isDark = value;
    notifyListeners();
  }

  void changeColor(Color color) {
    // debugPrint('mudou');
    _primaryColor = color;
    notifyListeners();
  }
}
