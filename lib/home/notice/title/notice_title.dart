import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticeTitleWidget extends StatelessWidget {
  const NoticeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            '공지사항',
            style: TextStyle(color: Colors.black),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // 검색 기능 추가
            },
          ),
        ],
      ),
    );
  }
}