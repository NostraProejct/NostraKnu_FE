import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});


  @override
  State<StatefulWidget> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/Profile_image.jpg'),
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
                const SizedBox(height: 10.0),
                // 프로필 수정 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    OutlinedButton(
                      onPressed: () {
                        context.go('/settings/manage');
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
                      child: const Text(
                        "프로필 공유",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        // 하단 알림 화면 표시
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context); // 하단 시트 닫기
                                    },
                                    child: Image.asset('asset/images/KakaoTalk.png')
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height * 0.2
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context); // 하단 시트 닫기
                                    },
                                    child: Image.asset('asset/images/KakaoTalk.png')
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },

                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('계정', style: TextStyle(color: Colors.grey),),
                    makeOptionsBox("계정 관리"),
                  ],
                ),

                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('일반', style: TextStyle(color: Colors.grey),),
                    makeOptionsBoxWithPic('asset/images/Lan.png', "글자/언어", '/settings/lan'),
                    SizedBox(height: 10,),
                    makeOptionsBoxWithPic('asset/images/Notification.png', "알림/권한", '/settings/notifications'),
                    SizedBox(height: 10,),
                    makeOptionsBoxWithPic('asset/images/Option.png', "기타", '/settings/etc'),
                  ],
                ),

                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('정보', style: TextStyle(color: Colors.grey),),
                    makeOptionsBoxWithPic('assets/images/Favorites.png', "공지사항", '/settings/bulletBoard'),
                    SizedBox(height: 10,),
                    makeOptionsBoxWithPic('assets/images/Favorites.png', "앱 관리", '/settings/manage'),
                    SizedBox(height: 10,),
                    makeOptionsBoxWithPic('assets/images/Favorites.png', "개인정보처리방침", 'settings/privacy'),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
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
                              Text("로그아웃 하시겠어요?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),),
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
                                    child: Text("로그아웃", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),),
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
                  child: Center(
                    child: Text('로그아웃', style: TextStyle(color: Colors.black),),
                  ),
                ),
              ),

              Center(
                child: TextButton(
                  child: Text('계정 탈퇴',style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey
                  ),),
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
                                    child: Text("계정탈퇴", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),),
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
                  ),

              ),
              SizedBox(height: 10,)
            ],
          )
        ],
      ),
    );
  }

  Widget makeOptionsBox(String title)  {
    return InkWell(
      onTap: () {
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
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {

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

  Widget makeOptionsBoxWithPic(String imgPath, String title, String movePath)  {
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
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Favorites.png', width: 30,),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
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