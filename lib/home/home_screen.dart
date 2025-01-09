import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'package:nostra/home/section/noticeSection.dart';
import 'package:nostra/home/section/cafeteriaSection.dart';
import 'package:nostra/home/section/activitySection.dart';
import 'package:nostra/home/section/employmentSection.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
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
          iconSize: 29,
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
            radius: 15,
          ),
        ),
        SizedBox(width: 14),
      ],
    );
  }

  Widget _body() {
    return Column(
      children: [
        // 공지사항
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            color: Colors.brown[100],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          child: NoticeSection(),
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
                    CafetriaSection(onTap: () {
                      context.go('/cafeteria'); // 학식 페이지로 이동
                    },
                    ),
                    ActivitySection(
                      onTap: () {
                        context.go('/activities'); // 대외활동 페이지로 이동
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // 취업
                EmploymentSection(
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
    );
  }
}
