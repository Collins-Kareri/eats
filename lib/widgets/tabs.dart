import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  late final List<Widget> _tabs;

  MyTab(List<Widget> tabs, {super.key}) {
    _tabs = tabs;
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    elevation: 1.0,
    minimumSize: const Size(88, 36),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );

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
