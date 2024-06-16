import 'package:flutter/material.dart';
import 'menuDirectory/SettingsApp.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메뉴'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/profile/profile_image.png'), // profile Image
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lamu_01',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Text('팔로워 0', style: TextStyle(fontSize: 16)),
                          Text('팔로잉 0', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10), // 좌우 간격 10
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 버튼을 좌우 끝에 배치
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )
                            ),
                            onPressed: () {
                              // 프로필 관리 기능 추가
                            },
                            child: Text('프로필 관리'),
                          ),
                        ),
                        SizedBox(width: 10), // 각 버튼 사이 간격 10
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )
                            ),
                            onPressed: () {
                              // 프로필 공유 기능 추가
                            },
                            child: Text('프로필 공유'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '계정',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('계정 관리'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black.withOpacity(0.3), // 아이콘의 투명도 30%
              ),
              onTap: () {
                // 계정 관리 기능 추가
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '일반',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text('다크모드'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language_outlined),
              title: Text('글자/언어'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black.withOpacity(0.3), // 아이콘의 투명도 30%
              ),
              onTap: () {
                // 글자/언어 설정 기능 추가
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications_none_rounded),
              title: Text('알림/권한'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black.withOpacity(0.3), // 아이콘의 투명도 30%
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsApp()), // SettingsApp으로 이동
                );
                },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.more_horiz_outlined),
              title: Text('기타'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black.withOpacity(0.3), // 아이콘의 투명도 30%
              ),
              onTap: () {
                // 기타 설정 기능 추가
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '정보',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.announcement_rounded),
              title: Text('공지사항'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black.withOpacity(0.3), // 아이콘의 투명도 30%
              ),
              onTap: () {
                // 공지사항 기능 추가
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text('앱 관리'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black.withOpacity(0.3), // 아이콘의 투명도 30%
              ),
              onTap: () {
                // 앱 관리 기능 추가
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined),
              title: Text('개인정보처리방침'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black.withOpacity(0.3), // 아이콘의 투명도 30%
              ),
              onTap: () {
                // 개인정보처리방침 기능 추가
              },
            ),
          ],
        ),
      ),
    );
  }
}
