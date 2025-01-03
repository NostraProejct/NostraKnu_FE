import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityListTitle extends StatelessWidget {
  const CommunityListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // 배경색 설정
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.pop();
            },
          ),
          const Text(
            '정보 게시판',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}