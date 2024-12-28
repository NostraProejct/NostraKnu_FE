import 'package:flutter/material.dart';

class CommunityMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CommunityMain();
  }
}

class _CommunityMain extends State<CommunityMain> {
  @override
  Widget build(BuildContext context) {
    final String subTitle_one = "정보 게시판";
    final String subTitle_two = "취업ㆍ진로 게시판";
    final String subTitle_three = "대외활동 게시판";

    Widget boxListContainer(String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 50,
              color: Colors.red,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("CommunityMain"),
      ),
      body: Column(
        children: [
          Expanded(child: boxListContainer(subTitle_one)), // 정보 게시판
          Expanded(child: boxListContainer(subTitle_two)), // 취업 진로 게시판
          Expanded(child: boxListContainer(subTitle_three)), // 대외 활동 게시판
        ],
      ),
    );
  }

}