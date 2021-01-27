import 'package:flutter/material.dart';

class FontState with ChangeNotifier {
  bool bold = false;

  changeBold(bool val) {
    bold = val;
    notifyListeners();
  }
}
