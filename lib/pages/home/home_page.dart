import 'package:flutter/material.dart';
import 'package:firstapp/ui/app_bar.dart';
import 'package:firstapp/pages/home/content/homepage_content.dart';
import 'package:firstapp/ui/bottom_navigation.dart';

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

  int _selectedIndex = 0;

  _HomePageState() {
    _myTabs = tabs;
  }

  static final List<Widget> pageContent = [
    HomePageContent(_myTabs),
    const Center(child: Text("tickets")),
    const Center(child: Text("order")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50.0), child: MyAppBar()),
          body: pageContent[_selectedIndex],
          bottomNavigationBar: BottomNavBar(_selectedIndex, _onItemTapped)),
    );
  }
}
