import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nostra/community/main/communityMain.dart';
import 'package:nostra/home/title/home_title.dart';

import '../community/list/communityList.dart';
import '../community/main/title/communityTitle.dart';
import '../setting/settingPage.dart';
import '../setting/title/setting_title.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {

  final Widget child;
  final Widget? customTitle;  // 추가
  final Color? customBackgroundColor;  // 추가

  const MainPage({
    super.key,
    required this.child,
    this.customTitle,
    this.customBackgroundColor
  });

  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> bottomItems = [
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

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("Map Screen")), // 임시 Map 화면
    CommunityMain(),
    SettingPage(),
  ];

  // 각 페이지에 해당하는 제목
  final List<Widget> _titles = [
    HomeTitleWidget(),
    Text(
      'Map',
    ),
    CommunityTitle(),
    SettingTitleWidget(),
  ];

  final List<Color> _backgroundColors = [
    Colors.grey[300]!,  // Home 화면 색상
    Colors.white,        // Map 화면 색상
    Colors.white,        // My Page 화면 색상
    Colors.white,        // Settings 화면 색상
  ];

  final List<Color> _titleBackgroundColors = [
    Colors.brown[100]!,  // Home 화면 색상
    Colors.white,        // Map 화면 색상
    Colors.white,        // My Page 화면 색상
    Colors.white,        // Settings 화면 색상
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.customBackgroundColor ?? _backgroundColors[_currentIndex],
      appBar: AppBar(
        backgroundColor: widget.customBackgroundColor ?? _titleBackgroundColors[_currentIndex],
        elevation: 0,
        title: widget.customTitle ?? _titles[_currentIndex],
        actions: _currentIndex == 0 ? [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              // 검색 버튼 동작
            },
          ),
          GestureDetector(
            onTap: () {
              // 프로필 사진 클릭 시 동작
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'), // 프로필 이미지
              radius: 16,
            ),
          ),
        ]
            : null,
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            switch(index) {
              case 0:
                context.go('/');
                setState(() {
                  _currentIndex = index;
                });
                break;
              case 1:
                context.go('/map');
                setState(() {
                  _currentIndex = index;
                });
                break;
              case 2:
                context.go('/community');
                setState(() {
                  _currentIndex = index;
                });
                break;
              case 3:
                context.go('/settings');
                setState(() {
                  _currentIndex = index;
                });
                break;
            }
          });
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