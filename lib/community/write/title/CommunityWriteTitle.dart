import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityWriteTitle extends StatelessWidget {
  const CommunityWriteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            '글쓰기',
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