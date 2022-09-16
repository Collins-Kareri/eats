import 'package:flutter/material.dart';
import 'package:firstapp/ui/app_bar.dart';
import 'package:firstapp/ui/foods.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize:  const Size.fromHeight(80.0),
            child: MyAppBar(tabs)
          ),
          body: Column(
            children: [
              Foods('appertizers'),
            ],
          ),
          bottomNavigationBar: const BottomNavBar()
      ),
    );
  }
}