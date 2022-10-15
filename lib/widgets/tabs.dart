import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  late final List<Widget> _tabs;

  MyTab(List<Widget> tabs, {super.key}) {
    _tabs = tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ButtonsTabBar(
        tabs: _tabs,
        backgroundColor: Colors.black,
        unselectedBackgroundColor: Colors.transparent,
        borderWidth: 1.0,
        buttonMargin:
            const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
