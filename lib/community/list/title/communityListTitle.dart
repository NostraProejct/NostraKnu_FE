import 'package:flutter/material.dart';

class CommunityListTitle extends StatelessWidget {
  const CommunityListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // 배경색 설정
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            '정보 게시판',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              // 검색 버튼 동작
            },
          ),
        ],
      ),
    );
  }
}
