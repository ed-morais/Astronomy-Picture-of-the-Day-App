import 'package:flutter/material.dart';

class RatingAppProvider with ChangeNotifier {
  double _rate = 0.0;

  double get rate => _rate;

  void changeRate(double newRate) {
    _rate = newRate;
    notifyListeners();
  }
}
