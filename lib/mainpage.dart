import 'package:flutter/material.dart';
import 'package:nostra/pages/HomeDirectory/Home.dart';
import 'package:nostra/pages/Map.dart';
import 'package:nostra/pages/MyTrip.dart';
import 'package:nostra/pages/Community.dart';
import 'package:nostra/pages/Menu.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home_outlined)
    ),
    BottomNavigationBarItem(
        label: 'Map',
        icon: Icon(Icons.map_outlined)
    ),
    BottomNavigationBarItem(
        label: 'MyTrip',
        icon: Icon(Icons.add_box_outlined)
    ),
    BottomNavigationBarItem(
        label: 'Community',
        icon: Icon(Icons.chat_bubble_outlined)
    ),
    BottomNavigationBarItem(
        label: 'Menu',
        icon: Icon(Icons.menu_outlined)
    )
  ];
  List pages = [
    Home(),
    Map(),
    MyTrip(),
    Community(),
    Menu(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white, // bottomNavigationBar 배경색
        selectedItemColor : Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: bottomItems,
      ),
    );
  }
}

