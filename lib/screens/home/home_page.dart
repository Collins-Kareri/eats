import 'package:flutter/material.dart';
import 'package:firstapp/widgets/app_bar.dart';
import 'package:firstapp/screens/home/homepage_content.dart';
import 'package:firstapp/screens/orders.dart';
import 'package:firstapp/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  late int _currentPageIndex;

  HomePage({super.key, int index = 0}) {
    _currentPageIndex = index;
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> tabs = [
    const Tab(text: "Appetizers"),
    const Tab(text: "Chicken"),
    const Tab(text: "Drinks"),
    const Tab(text: "Fish"),
    const Tab(text: "Sides"),
    const Tab(text: "Vegeterian"),
  ];

  static late List<Widget> _myTabs;

  _HomePageState() {
    _myTabs = tabs;
  }

  static final List<Widget> pageContent = [
    HomePageContent(_myTabs),
    const Center(child: Orders()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget._currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: MyAppBar(),
          ),
          body: pageContent[widget._currentPageIndex],
          bottomNavigationBar:
              BottomNavBar(widget._currentPageIndex, _onItemTapped)),
    );
  }
}
