import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  ];

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("Map Screen")), // 임시 Map 화면
    Center(child: Text("My Page Screen")), // 임시 마이페이지 화면
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 상단 갈색 배경 섹션
        Container(
          color: Colors.brown[100],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 공지사항 제목
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 3.0, bottom: 12.0),
                child: Text(
                  '컴퓨터공학과',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              // 공지사항 칸
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
        // 학식, 대외활동, 취업 섹션
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 학식과 대외활동
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureSection(title: '학식'),
                    FeatureSection(title: '대외활동'),
                  ],
                ),
                const SizedBox(height: 16),
                // 취업
                FeatureSection(title: '취업', isFullWidth: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 개별 섹션 디자인 위젯
class FeatureSection extends StatelessWidget {
  final String title;
  final bool isFullWidth;

  const FeatureSection({required this.title, this.isFullWidth = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 텍스트 (카드 위에 위치)
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        // 카드 배경
        Container(
          width: isFullWidth ? double.infinity : (MediaQuery.of(context).size.width - 50) / 2,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
