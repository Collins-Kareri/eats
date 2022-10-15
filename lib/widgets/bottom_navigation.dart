import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  late final int _currentIndex;
  late final dynamic _onItemTapped;

  BottomNavBar(int currentIndex, void Function(int) onItemTapped, {super.key}) {
    _currentIndex = currentIndex;
    _onItemTapped = onItemTapped;
  }

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  final GlobalKey bottomNavBarGlobalKey = GlobalKey(debugLabel: 'bottomAppBar');
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        key: bottomNavBarGlobalKey,
        iconSize: 24.0,
        selectedFontSize: 16.0,
        unselectedFontSize: 16.0,
        selectedItemColor: Colors.black,
        currentIndex: widget._currentIndex,
        onTap: widget._onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_sharp),
            label: 'Orders',
          ),
        ]);
  }
}
