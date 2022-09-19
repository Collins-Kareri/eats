import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {

  late final List<Widget> _tabs;

  MyTab(List<Widget> tabs, {super.key}){
    _tabs = tabs;
  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.grey[600],
    backgroundColor: Colors.grey[200],
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
      labelColor: Colors.grey[800],
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      indicatorColor: Colors.black,
      overlayColor: MaterialStateProperty.all(Colors.black),
      indicatorPadding: const EdgeInsets.all(4.0),
    );
  }
}
