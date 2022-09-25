import 'package:flutter/material.dart';
import 'package:firstapp/widgets/app_bar.dart';
import 'package:firstapp/screens/home/homepage_content.dart';
import 'package:firstapp/screens/events.dart';
import 'package:firstapp/screens/orders.dart';
import 'package:firstapp/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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

  int _currentPageIndex = 0;

  _HomePageState() {
    _myTabs = tabs;
  }

  static final List<Widget> pageContent = [
    HomePageContent(_myTabs),
    const Center(child: Events()),
    const Center(child: Orders()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50.0), child: MyAppBar()),
          body: pageContent[_currentPageIndex],
          bottomNavigationBar: BottomNavBar(_currentPageIndex, _onItemTapped)),
    );
  }
}
