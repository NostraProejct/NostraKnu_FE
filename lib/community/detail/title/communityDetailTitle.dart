import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityDetailTitle extends StatelessWidget {
  const CommunityDetailTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.go('/community/list');
            },
          ),
          const Text(
            '글',
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
