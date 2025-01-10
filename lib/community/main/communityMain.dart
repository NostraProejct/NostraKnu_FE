import 'package:flutter/material.dart';
import 'package:nostra/community/main/noticeBoardSection.dart';
import 'package:nostra/community/main/title/communityTitle.dart';

import 'data/boardTextData.dart';
import 'data/data.dart';


class CommunityMain extends StatefulWidget {

  @override
  State createState() => _CommunityMain();
}

class _CommunityMain extends State {

  final boardDatas = [
    BoardTextData(
      title: '정보 게시판',
      posts: [
        Data('Lamu_01', '24시간 전', '이거 보아주려고 여기로 왔었다', 115),
        Data('KARL', '3일 전', '김준희 비보', 98),
        Data('Lamu_01', '5분 전', '대충 긴 정보', 76),
      ],
    ),
    BoardTextData(
      title: '취업ㆍ진로 게시판',
      posts: [
        Data('Lamu_01', '3시간 전', '스터디 화상부 구합니다', 221),
        Data('KARL0263', '1년 전', '23 년 경쟁과 여친구함', 169),
        Data('Lamu_01', '5초 전', '부트캠프 참가자 모집!!', 99),
      ],
    ),
    BoardTextData(
      title: '대외활동 게시판',
      posts: [
        Data('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
        Data('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
        Data('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: CommunityTitle(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          NoticeBoardSection(data: boardDatas[0], backgroundColor: Color(0xFFF6F3E8)),
          NoticeBoardSection(data: boardDatas[1], backgroundColor: Color(0xFFEAE0D8)),
          NoticeBoardSection(data: boardDatas[2], backgroundColor: Color(0xFFDFDCD4))
        ],
      ),
    );
  }
}