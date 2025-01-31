import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:go_router/go_router.dart';
import 'package:nostra/setting/manageProfile/stepper.dart';

final boardData = [
  BoardData_pre('3시간 전', '공지', '버전 업데이트 안내'),
  BoardData_pre('20시간 전', '공지', '굿즈 서비스 출시 안내'),
  BoardData_pre('3일 전', '공지', '5월 첫차 굿딜 프로모션 안내'),
  BoardData_pre('2025-01-10 전', '공지', '김준희 바보'),
  BoardData_pre('2025-01-05', '발표', '새로운 혁신 기술 발표 안내'),
  BoardData_pre('2025-01-01', '알림', '이러쿵 저러쿵'),
  BoardData_pre('2024-12-25', '공지', '쏼라 쏼라'),
  BoardData_pre('2024-12-12', '알림', '저녁 메뉴 추천받아요'),
];

class SettingBulletBoard extends StatefulWidget {
  const SettingBulletBoard({super.key});

  @override
  State<StatefulWidget> createState() => _SettingBulletBoard();
}
class _SettingBulletBoard extends State<SettingBulletBoard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Stack(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 50),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '공지사항',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "공지", "공지사항", '/settings/bulletBoard'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "발표", "앱 관리", '/settings/manage'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "알람", "개인정보처리방침", '/settings/privacy'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "공지", "공지사항", '/settings/bulletBoard'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "발표", "앱 관리", '/settings/manage'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "알람", "개인정보처리방침", '/settings/privacy'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "공지", "공지사항", '/settings/bulletBoard'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "발표", "앱 관리", '/settings/manage'),
                  SizedBox(height: 10,),
                  makeBoardBoxWithPic('assets/images/Favorites.png', "시간", "알람", "개인정보처리방침", '/settings/privacy'),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeBoardBoxWithPic(String imgPath, String time, String division, String content, String movePath, )  {
    return InkWell(
      onTap: () {
        context.go(movePath);
      },
      splashColor: Colors.blue.withOpacity(0.3),
      highlightColor: Colors.blue.withOpacity(0.1),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '[',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            division,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '] ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            content,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ]
                ),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  onPressed: () {
                    context.go(movePath);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class BoardData_pre {
  final String time;
  final String division;
  final String content;

  BoardData_pre(this.time, this.division, this.content);
}