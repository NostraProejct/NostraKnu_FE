import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoticeSectionState();
}

class _NoticeSectionState extends State<NoticeSection> {
  late final PageController _noticePageController;
  int _currentNoticeIndex = 0;

  final List<Map<String, String>> recentNotices = [
    {"id": "1045", "title": "공지사항 1 제목", "date": "24.10.01"},
    {"id": "1044", "title": "진로ㆍ취업 프로그램 운영을 위한 사전 수요 조사 참여 안내", "date": "24.10.02"},
    {"id": "1043", "title": "공지사항 3 제목", "date": "24.10.03"},
    {"id": "1042", "title": "공지사항 4 제목", "date": "24.10.04"},
    {"id": "1041", "title": "[데이터보안활용혁신융합대학 사업단] 2025학년도 1학기 아주대학교 교류수학 안내", "date": "24.10.05"},
  ];

  @override
  void initState() {
    // 초기 페이지를 가운데로 설정, 양방향 스크롤 가능
    super.initState();
    _noticePageController = PageController(
      initialPage: recentNotices.length * 100, // 임의의 큰 값으로 설정
      viewportFraction: 0.88,
    );
  }

  @override
  void dispose() {
    _noticePageController.dispose();
    super.dispose();
  }

  int _calculateActualIndex(int pageIndex) {
    return pageIndex % recentNotices.length; // 실제 인덱스는 페이지 수로 나눈 나머지 값
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            width: double.infinity,
            height: 200,
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
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFEAD3C1),
                      borderRadius: BorderRadius.circular(20),
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
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
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
                        SizedBox(height: 35),
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
                (index) =>
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: _currentNoticeIndex == index ? Colors.black : Colors
                        .grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}