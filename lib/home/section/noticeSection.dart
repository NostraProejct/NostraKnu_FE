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
    {"id": "1045", "title": "강원대학교 공지사항", "date": "24.10.01"},
    {"id": "1044", "title": "컴퓨터공학과 공지사항", "date": "24.10.02"},
    {"id": "1043", "title": "언어연수과 공지사항", "date": "24.10.03"},
    {"id": "1042", "title": "취업지원과 공지사항", "date": "24.10.04"},
    {"id": "1041", "title": "총학생회 홈페이지", "date": "24.10.05"},
  ];

  @override
  void initState() {
    // 초기 페이지를 가운데로 설정, 양방향 스크롤 가능
    super.initState();
    _noticePageController = PageController(
      initialPage: recentNotices.length * 100, // 임의의 큰 값으로 설정
      viewportFraction: 1.0,
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
        GestureDetector(
          onTap: () {
            context.go('/notice');
          },
          child: Container(
            height: 220,
            width: double.infinity,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 1.0, // 이거 다시 확인하기, _noticepageController에서 바꾸면 안바뀜
              ),
              onPageChanged: (index) {
                setState(() {
                  _currentNoticeIndex = _calculateActualIndex(index);
                });
              },
              itemBuilder: (context, index) {
                final actualIndex = _calculateActualIndex(index);
                final notice = recentNotices[actualIndex];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                        SizedBox(height: 5),
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
                        SizedBox(height: 60),
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
        Padding(
          padding: const EdgeInsets.only(top: 15.0,bottom: 5.0),
          child: Row(
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
        ),
      ],
    );
  }
}