import 'package:flutter/material.dart';

class FoodImages with ChangeNotifier {
  final List _foodimages = [];

  List get images {
    return _foodimages;
  }

  void addImage(Map imageDetails) {
    final index = _foodimages.indexWhere(
        (element) => element['foodname'] == imageDetails["foodname"]);

    if (index == -1) {
      _foodimages.add(imageDetails);
    }

    return;
  }

  String getImage(String foodname) {
    final index =
        _foodimages.indexWhere((element) => element['foodname'] == foodname);

    return _foodimages[index]['coverImg'];
  }
}
