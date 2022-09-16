import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  late final int _currentIndex;
  late final dynamic _onItemTapped;

  BottomNavBar(int currentIndex, void Function(int) onItemTapped, {super.key}) {
    _currentIndex = currentIndex;
    _onItemTapped = onItemTapped;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 28.0,
        selectedFontSize: 18.0,
        unselectedFontSize: 16.0,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters_sharp),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_sharp),
            label: 'Orders',
          ),
        ]);
  }
}
