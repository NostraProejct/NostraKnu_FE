import 'package:flutter/material.dart';

class SettingsApp extends StatefulWidget {
  @override
  _SettingsAppState createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  // 각 스위치의 상태를 관리하는 변수
  bool pushNotification = true;
  bool locationAgreement = true;
  bool followNotification = true;
  bool likeNotification = true;
  bool chatNotification = true;
  bool mentionNotification = true;
  bool marketingNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('알림/권한'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로 가기
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('설정', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            title: Text('푸시 알림'),
            value: pushNotification,
            onChanged: (bool value) {
              setState(() {
                pushNotification = value; // 상태 변경
              });
            },
          ),
          SwitchListTile(
            title: Text('위치 정보 서비스 이용약관 동의'),
            value: locationAgreement,
            onChanged: (bool value) {
              setState(() {
                locationAgreement = value; // 상태 변경
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text('알림', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            title: Text('팔로워'),
            value: followNotification,
            onChanged: (bool value) {
              setState(() {
                followNotification = value; // 상태 변경
              });
            },
          ),
          SwitchListTile(
            title: Text('좋아요'),
            value: likeNotification,
            onChanged: (bool value) {
              setState(() {
                likeNotification = value; // 상태 변경
              });
            },
          ),
          SwitchListTile(
            title: Text('채팅 알림'),
            value: chatNotification,
            onChanged: (bool value) {
              setState(() {
                chatNotification = value; // 상태 변경
              });
            },
          ),
          SwitchListTile(
            title: Text('멘션 알림'),
            value: mentionNotification,
            onChanged: (bool value) {
              setState(() {
                mentionNotification = value; // 상태 변경
              });
            },
          ),
          Divider(),
          ListTile(
            title: Text('광고성 정보 수신', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            title: Text('마케팅 정보 알림'),
            value: marketingNotification,
            onChanged: (bool value) {
              setState(() {
                marketingNotification = value; // 상태 변경
              });
            },
          ),
        ],
      ),
    );
  }
}