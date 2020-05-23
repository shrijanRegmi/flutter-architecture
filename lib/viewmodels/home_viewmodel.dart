import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increaseValue() {
    _counter++;
    notifyListeners();
  }

  void decreaseValue() {
    if (_counter >0) {
      _counter--;
    }
    notifyListeners();
  }
}
