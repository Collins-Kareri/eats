import 'package:flutter/material.dart';

class MyCart with ChangeNotifier {
  final List _itemsInCart = [];
  int _totalPrice = 0;

  List get cartItems {
    return _itemsInCart;
  }

  int get total {
    return _totalPrice;
  }

  void _calculateTotal() {
    _totalPrice = 0;

    for (var element in _itemsInCart) {
      final price = RegExp(r'(\d+)').firstMatch(element['price'])?[0];
      int count = int.parse(element["count"]);
      if (price != null) {
        _totalPrice = (_totalPrice + (int.parse(price) * count));
      }
    }
  }

  void addItem(Map item) {
    final index = _itemsInCart
        .indexWhere((element) => element['foodname'] == item["foodname"]);

    if (index >= 0) {
      addItemCount(index);
      notifyListeners();
      return;
    }

    item['count'] = '1';
    _itemsInCart.add(item);
    _calculateTotal();
    notifyListeners();
  }

  void removeItem(int index) {
    _itemsInCart.removeAt(index);
    _calculateTotal();
    notifyListeners();
  }

  void addItemCount(int index) {
    final item = _itemsInCart[index];
    item['count'] = (int.parse(item['count']) + 1).toString();

    _itemsInCart[index] = item;

    _calculateTotal();
    notifyListeners();
  }

  void reduceItemCount(int index) {
    final item = _itemsInCart[index];
    int currentCount = int.parse(item['count']);

    if (currentCount > 1) {
      item['count'] = (currentCount - 1).toString();
      _itemsInCart[index] = item;
      _calculateTotal();
    }

    notifyListeners();
  }
}
