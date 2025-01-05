import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nostra/home/title/home_title.dart';
import '../community/main/title/communityTitle.dart';

class MainPage extends StatelessWidget {

  final StatefulNavigationShell navigationShell;
  final Widget? customTitle;
  final Color? customBackgroundColor;

  const MainPage({
    Key? key,
    required this.navigationShell,
    this.customTitle,
    this.customBackgroundColor
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

  // 각 페이지에 해당하는 제목
  static final List<Widget> _titles = [
    HomeTitleWidget(),
    Text(
      'Map',
    ),
    CommunityTitle(),
    Text(
      'Settings',
    ),
  ];

  static final List<Color> _backgroundColors = [
    Colors.grey[200]!,   // 홈창 색상
    Colors.white,        // 맵창 색상
    Colors.white,        // 커뮤니티창 색상
    Colors.white,        // 마이페이지창 색상
  ];

  static final List<Color> _titleBackgroundColors = [
    Colors.brown[100]!,  // 홈창 상단바 색상
    Colors.white,        // 맵창 상단바 색상
    Colors.white,        // 커뮤니티창 상단바 색상
    Colors.white,        // 마이페이지창 상단바 색상
  ];

  @override
  Widget build(BuildContext context) {
    final int currentIndex = navigationShell.currentIndex;

    return Scaffold(
      backgroundColor: customBackgroundColor ?? _backgroundColors[currentIndex],
      appBar: AppBar(
        backgroundColor: customBackgroundColor ?? _titleBackgroundColors[currentIndex],
        elevation: 0,
        title: customTitle ?? _titles[currentIndex],
        actions: currentIndex == 0 ? [
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
        ] : null,
      ),
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