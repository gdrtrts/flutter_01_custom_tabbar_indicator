import 'package:flutter/material.dart';

class HomeModel with ChangeNotifier {
  final double _dotSize = 20.0;
  final double _horizontalSpacing = 40.0;

  get dotSize => _dotSize;

  double _totalWidth() {
    return (_dotSize * 2) + (_dotSize * 3) + _horizontalSpacing;
  }

  double center(width) {
    return width / 2.0 - _totalWidth() / 2;
  }

  double spacing(width, i) {
    return _horizontalSpacing * i - (i == 0 ? 0.0 : width - (_dotSize * 3));
  }

  double animation(i) {
    return _dotSize * (i == index ? 3.0 : 1.0);
  }

  int index = 0;
  double moveMiddle = 0.0;
  bool isTapped = false;

  void updateIndex(int i) {
    if (i == 2) {
      translateX(-_dotSize * 2);
    } else {
      translateX(0.0);
    }

    index = i;
    notifyListeners();
  }

  void translateX(double m) {
    moveMiddle = m;
    notifyListeners();
  }
}
