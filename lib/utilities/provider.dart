import 'package:flutter/material.dart';

class AppbarState extends ChangeNotifier {
  bool hideCartIcon = false;
  String title = "My Account";

  void hideCartIconAndChangeTitle() {
    hideCartIcon = true;
    title = "Cart";
    notifyListeners();
  }
}
