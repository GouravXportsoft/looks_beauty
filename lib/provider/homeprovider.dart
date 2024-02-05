import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List sortList = [];

  void addToList(String value) {
    if (!sortList.contains(value)) {
      sortList.add(value);
    } else {
      sortList.remove(value);
    }
    notifyListeners();
  }
}
