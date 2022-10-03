import 'package:flutter/material.dart';

class MyOrders with ChangeNotifier {
  final List orders = [];

  List get allOrders {
    return orders;
  }

  List addOrder(Map order) {
    orders.add(order);
    return orders;
  }
}
