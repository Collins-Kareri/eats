import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  late final List<Widget> _tabs;

  MyTab(List<Widget> tabs, {super.key}) {
    _tabs = tabs;
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      padding: const EdgeInsets.all(16.0),
      tabs: _tabs,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      indicatorPadding: const EdgeInsets.all(4.0),
    );
  }
}
