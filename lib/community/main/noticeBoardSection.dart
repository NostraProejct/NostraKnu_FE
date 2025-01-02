import 'package:flutter/material.dart';
import 'package:nostra/community/main/data/boardTextData.dart';

import 'PostItem.dart';

class NoticeBoardSection extends StatelessWidget {
  final BoardTextData data;
  const NoticeBoardSection({required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              data.title,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.add, size: 24),
                ),
              ),
              ...data.posts.map((post) => PostItem(data: post)),
            ],
          ),
        ),
      ],
    );
  }
}