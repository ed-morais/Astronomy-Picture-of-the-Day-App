import 'package:flutter/material.dart';

class ConfigAppProvider with ChangeNotifier {
  double _rate = 0.0;
  bool _isDark = true;

  double get rate => _rate;
  bool get isDark => _isDark;

  void changeRate(double newRate) {
    _rate = newRate;
    notifyListeners();
  }

  void changeTheme(value) {
    _isDark = value;
    notifyListeners();
  }
}
