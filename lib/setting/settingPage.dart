import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color(0xF8F8F8F8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  // 프로필 이미지와 버튼을 Column으로 묶음
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.jpg'),
                        radius: 70.0,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "유저 아이디",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "팔로워",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "팔로잉",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0), // 이미지와 버튼 간 간격
              // 프로필 수정 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                        builder: ((context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero, // 내부 여백을 0으로 설정
                            insetPadding: EdgeInsets.zero,
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                SizedBox(height: 45,),
                                Text("정말로", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                Text("회원을 탈퇴하시겠어요?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
                                SizedBox(height: 45,)
                              ],
                            ),

                            actions: <Widget>[
                              Column(
                                children: [
                                  Divider(
                                    color: Color(0xffcccccc), // 색상
                                    thickness: 2, // 두께
                                    height: 0, // Divider의 높이를 0으로 설정하여 위아래 여백 최소화
                                  ),
                                  Container(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // 내부 여백 조정
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(); //창 닫기
                                      },
                                      child: Text("회원탈퇴", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),),
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xffcccccc), // 색상
                                    thickness: 2, // 두께
                                    height: 0, // Divider의 높이를 0으로 설정하여 위아래 여백 최소화
                                  ),
                                  Container(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); //창 닫기
                                      },
                                      child: Text("취소", style: TextStyle(color: Colors.black),),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          );
                        }),
                      );
                    },
                    child: const Text(
                      "프로필 관리",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2.0),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "프로필 공유",:
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
