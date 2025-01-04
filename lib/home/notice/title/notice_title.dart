import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeTitleWidget extends StatelessWidget {
  const NoticeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          iconSize: 26,
          onPressed: () => context.pop(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 107.0, top: 9.5, right: 21.0),
          child: Text(
            '공지사항',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          iconSize: 26,
          onPressed: () {
            // 검색 기능 추가
          },
        ),
      ],
    );
  }
}