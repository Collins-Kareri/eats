import 'package:flutter/material.dart';
import 'package:firstapp/widgets/tabs.dart';
import 'package:firstapp/screens/home/foods/foods_card_ui_states.dart';

class HomePageContent extends StatelessWidget {
  late final List<Widget> _myTabs;

  HomePageContent(List<Widget> tabs, {super.key}) {
    _myTabs = tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.0, child: MyTab(_myTabs)),
        Expanded(
          child: TabBarView(children: [
            Column(
              children: [Foods('appetizers')],
            ),
            Column(
              children: [Foods('chicken')],
            ),
            Column(
              children: [Foods('drinks')],
            ),
            Column(
              children: [Foods('fish')],
            ),
            Column(
              children: [Foods('sides')],
            ),
            Column(
              children: [Foods('vegeterian')],
            ),
          ]),
        ),
      ],
    );
  }
}
