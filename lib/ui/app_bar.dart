import 'package:flutter/material.dart';
import 'package:firstapp/ui/tabs.dart';

class MyAppBar extends StatelessWidget {
  late final List<Widget> _tabs;

  MyAppBar(List<Widget> tabs, {super.key}) {
    _tabs = tabs;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('K A Y F I S H'),
      backgroundColor: Colors.grey[50],
      foregroundColor: Colors.grey[600],
      elevation: 1,
      actions: [
        IconButton(
            onPressed: (() {}),
            iconSize: 28.0,
            icon: const Icon(Icons.shopping_cart_sharp)),
        IconButton(
            onPressed: (() {}),
            iconSize: 28.0,
            icon: const Icon(Icons.account_circle_sharp))
      ],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0), 
          child: MyTab(_tabs)
      ),
    );
  }
}
