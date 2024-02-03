import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool agree = false;
  isagree() {
    agree = !agree;
    notifyListeners();
  }
}
