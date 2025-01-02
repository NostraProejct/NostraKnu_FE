import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
              children: const [
                // 학식과 대외활동
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureSection(title: '학식'),
                    FeatureSection(title: '대외활동'),
                  ],
                ),
                SizedBox(height: 16),
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
