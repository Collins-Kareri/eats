import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/providers/cart_provider.dart';
import 'package:firstapp/screens/mycart/cart_page.dart';
import 'package:firstapp/providers/user_provider.dart';
import 'package:firstapp/screens/account.dart';
import 'package:firstapp/screens/login.dart';

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

  void navigateToMyAccount(BuildContext context, Map currentUser) {
    if (currentUser.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Account()),
      );
    } else {
      showDialog(
        context: context,
        builder: ((context) {
          return SimpleDialog(
            titlePadding: const EdgeInsets.only(
              top: 16.0,
              bottom: 4.0,
              left: 24.0,
              right: 24.0,
            ),
            contentPadding: const EdgeInsets.only(
              top: 4.0,
              bottom: 16.0,
              left: 24.0,
              right: 24.0,
            ),
            title: const Text('Not logged in.'),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context, {'action': 'close'});
                    },
                    child: const Text('Cancel'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Login();
                        }),
                      );
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ],
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List cartItems = context.watch<MyCart>().cartItems;
    final Map accountDetails = context.watch<MyAccountDetails>().currentUser;

    return AppBar(
      title: const Text('E A T \' S'),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: (() => navigateToMyCart(context)),
          iconSize: 28.0,
          icon: Badge(
            badgeContent: Text(
              cartItems.length.toString(),
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
            onPressed: (() => navigateToMyAccount(context, accountDetails)),
            iconSize: 28.0,
            icon: const Icon(Icons.account_circle_sharp))
      ],
    );
  }
}
