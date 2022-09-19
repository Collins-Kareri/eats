import 'package:flutter/material.dart';
import 'package:firstapp/screens/cart.dart';
import 'package:firstapp/screens/account.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('K A Y F I S H'),
      elevation: 0,
      actions: [
        IconButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            }),
            iconSize: 28.0,
            icon: const Icon(Icons.shopping_cart_sharp)),
        IconButton(
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Account()),
              );
            }),
            iconSize: 28.0,
            icon: const Icon(Icons.account_circle_sharp))
      ],
    );
  }
}
