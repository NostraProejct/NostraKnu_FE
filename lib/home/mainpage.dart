import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {

  final StatefulNavigationShell navigationShell;

  const MainPage({
    Key? key,
    required this.navigationShell,
  }) : super(key: key);

  static const List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home, color: Colors.black),
    ),
    BottomNavigationBarItem(
      label: 'Map',
      icon: Icon(Icons.location_on_outlined),
      activeIcon: Icon(Icons.location_on, color: Colors.black),
    ),
    BottomNavigationBarItem(
      label: 'Community',
      icon: Icon(Icons.people_outline),
      activeIcon: Icon(Icons.people, color: Colors.black),
    ),
    BottomNavigationBarItem(
      label: 'My Page',
      icon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.settings, color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final int currentIndex = navigationShell.currentIndex;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) {
            navigationShell.goBranch(index, initialLocation: true);
          } else {
            navigationShell.goBranch(index);
          }
        },
        items: bottomItems,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}