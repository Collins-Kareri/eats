import 'package:flutter/material.dart';

class MyCart with ChangeNotifier {
  final List _itemsInCart = [];

  List get cartItems {
    return _itemsInCart;
  }

  void addItem(Map item) {
    if (_itemsInCart.contains(item)) {
      addItemCount(item);
      notifyListeners();
      return;
    }

    item['count'] = '1';
    _itemsInCart.add(item);
    notifyListeners();
  }

  void removeItem(Map item) {
    _itemsInCart.remove(item);
    notifyListeners();
  }

  void addItemCount(Map item) {
    _itemsInCart.remove(item);
    int currentCount = int.parse(item['count']);

    item['count'] = (currentCount + 1).toString();
    _itemsInCart.add(item);
    notifyListeners();
  }

  void reduceItemCount(Map item) {
    _itemsInCart.remove(item);
    int currentCount = int.parse(item['count']);

    if (currentCount > 1) {
      item['count'] = (currentCount - 1).toString();
      _itemsInCart.add(item);
    }

    notifyListeners();
  }
}
