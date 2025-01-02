import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nostra/community/communityMain.dart';

import 'home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home_outlined),
    ),
    BottomNavigationBarItem(
      label: 'Map',
      icon: Icon(Icons.location_on_outlined),
    ),
    BottomNavigationBarItem(
      label: 'My Page',
      icon: Icon(Icons.person_outline),
    ),
    BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(Icons.person_outline),
    ),
  ];

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("Map Screen")), // 임시 Map 화면
    CommunityMain(),
    Center(child: Text("Setting Screen"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100], // 갈색 배경
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nostra 제목
            Text(
              'Nostra',
              style: GoogleFonts.poppins( // Google Fonts 적용
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            // 강원대학교 춘천캠퍼스 부제목
            Text(
              '강원대학교 춘천캠퍼스',
              style: GoogleFonts.roboto( // Roboto 폰트
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        actions: [
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
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: bottomItems,
      ),
    );
  }
}