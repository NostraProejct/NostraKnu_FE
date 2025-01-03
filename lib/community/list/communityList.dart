import 'package:flutter/material.dart';

class CommunityList extends StatelessWidget {
  const CommunityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(  // Scaffold 대신 Container 사용
      color: Colors.white,  // 배경색 설정
      child: Column(
        children: [
          // CommunityList의 내용을 여기에 구현
          Text("Community List Content"),
        ],
      ),
    );
  }
}