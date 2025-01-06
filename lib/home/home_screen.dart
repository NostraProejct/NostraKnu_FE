import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _noticePageController;
  int _currentNoticeIndex = 0;

  final List<Map<String, String>> recentNotices = [
    {"id": "1045", "title": "공지사항 1 제목", "date": "24.10.01"},
    {"id": "1044", "title": "공지사항 2 제목", "date": "24.10.02"},
    {"id": "1043", "title": "공지사항 3 제목", "date": "24.10.03"},
    {"id": "1042", "title": "공지사항 4 제목", "date": "24.10.04"},
    {"id": "1041", "title": "공지사항 5 제목", "date": "24.10.05"},
  ];

  @override
  void initState() {  // 초기 페이지를 가운데로 설정, 양방향 스크롤 가능
    super.initState();
    _noticePageController = PageController(
      initialPage: recentNotices.length * 100, // 임의의 큰 값으로 설정
      viewportFraction: 0.87,
    );
  }

  @override
  void dispose() {
    _noticePageController.dispose();
    super.dispose();
  }

  int _calculateActualIndex(int pageIndex) {
    return pageIndex % recentNotices.length;  // 실제 인덱스는 페이지 수로 나눈 나머지 값
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nostra',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              '강원대학교 춘천캠퍼스',
              style: GoogleFonts.roboto(
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
      body: Column(
        children: [
          // 공지사항
          Container(
            color: Colors.brown[100],
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 3.0, bottom: 10.0),
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
                GestureDetector(
                  onTap: () {
                    context.go('/notice'); // 공지사항 페이지로 이동
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14.0),
                    height: 170,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _noticePageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentNoticeIndex = _calculateActualIndex(index);
                        });
                      },
                      itemBuilder: (context, index) {
                        final actualIndex = _calculateActualIndex(index);
                        final notice = recentNotices[actualIndex];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            padding: const EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notice["id"]!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  height: 75,
                                  child: Text(
                                    notice["title"]!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  notice["date"]!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // 점 네비게이션
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    recentNotices.length,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      width: 9,
                      height: 9,
                      decoration: BoxDecoration(
                        color: _currentNoticeIndex == index ? Colors.black : Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 학식, 대외활동, 취업 섹션
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0),
              child: Column(
                children: [
                  // 학식과 대외활동
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FeatureSection(
                        title: '학식',
                        onTap: () {
                          context.go('/cafeteria'); // 학식 페이지로 이동
                        },
                      ),
                      FeatureSection(
                        title: '대외활동',
                        onTap: () {
                          context.go('/activities'); // 대외활동 페이지로 이동
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // 취업
                  FeatureSection(
                    title: '취업',
                    isFullWidth: true,
                    onTap: () {
                      context.go('/employment'); // 취업 페이지로 이동
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 개별 섹션 디자인 위젯
class FeatureSection extends StatelessWidget {
  final String title;
  final bool isFullWidth;
  final VoidCallback onTap;

  const FeatureSection({required this.title, this.isFullWidth = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.list, color: Colors.black),
              SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            width: isFullWidth ? double.infinity : (MediaQuery.of(context).size.width - 50) / 2,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}
