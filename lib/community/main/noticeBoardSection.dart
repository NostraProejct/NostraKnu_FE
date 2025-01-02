  import 'package:flutter/material.dart';
  import 'package:nostra/community/main/data/boardTextData.dart';

  import 'PostItem.dart';

  class NoticeBoardSection extends StatelessWidget {
    final BoardTextData data;
    final Color backgroundColor;

    const NoticeBoardSection({required this.data, required this.backgroundColor});

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 게시글 컨테이너
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                // 게시글 목록
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: data.posts.map((post) => PostItem(data: post)).toList(),
                      ),
                    ),
                  ],
                ),
                // add 아이콘 버튼
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.add,
                      size: 16,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }