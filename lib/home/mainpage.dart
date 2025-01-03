import 'package:flutter/material.dart';

import '../community/main/communityMain.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int curPageIndex = 0;

  final List<Widget> pages = [ Text("Here is home page"), CommunityMain() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: pages[curPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curPageIndex,
          onTap: (idx) {
            setState(() {
              curPageIndex = idx;
            });
          },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Community',
          ),
        ],
      ),
    );
  }
}