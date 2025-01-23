import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:go_router/go_router.dart';
import 'package:nostra/setting/manageProfile/stepper.dart';

class SettingPrivacyPolicy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPrivacyPolicy();
}
class _SettingPrivacyPolicy extends State<SettingPrivacyPolicy> {
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
                  '개인정보처리방침',
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
                  Container(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('노스트라는 관련법령에 따라 이용자분들의 개인정보를 안전하게'
                            '처리하며 보호하고 있습니다. 노스트라는 개인정보 처리방침을 공개하여'
                            '이용자의 고충을 원활하게 처리할 수 있도록 하며, 개인정보를 안전하게'
                            '관리하고 있다는 것을 안내드립니다.', style: TextStyle(fontSize: 11),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    '1. 개인정보 처리방침',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('노스트라는 이용자의 동의를 받아 서비스 이용에 반드시 필요한 최소한의'
                            '정보를 수집하고 있습니다. 서비스 이용을 위해 반드시 필요한 항목은 필수 동의로,'
                            '그 외에는 선택 동의로 나누어 동의를 받고 있습니다.', style: TextStyle(fontSize: 11),),
                        Text('노스트라는 수집한 항목을 목적 외의 용도로는 이용하고 있지 않으며, 처리 항목과'
                            '목적이 변경될 시 개인정보 처리방침을 지속적으로 업데이트 하고 있습니다.', style: TextStyle(fontSize: 11),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}