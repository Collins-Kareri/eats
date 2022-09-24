import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/cart_provider.dart';
import 'package:firstapp/screens/cart.dart';
import 'package:firstapp/screens/account.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  void navigateToMyCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return const Cart();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('K A Y F I S H'),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: (() => navigateToMyCart(context)),
          iconSize: 28.0,
          icon: Badge(
            badgeContent: Text(
              context.watch<MyCart>().cartItems.length.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            badgeColor: Colors.blueGrey,
            elevation: 4.0,
            animationType: BadgeAnimationType.fade,
            child: const Icon(Icons.shopping_cart_sharp),
          ),
        ),
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
