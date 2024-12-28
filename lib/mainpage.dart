import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home_outlined)
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}