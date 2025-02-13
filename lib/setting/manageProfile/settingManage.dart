import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:go_router/go_router.dart';
import 'package:nostra/setting/manageProfile/stepper.dart';

class SettingManage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingManage();
}

class _SettingManage extends State<SettingManage> {

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
                    '프로필 관리',
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
                  height: 220,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/Profile_image.jpg'),
                              radius: 70.0,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                          },
                        ),
                      )
                    ],
                  )
              ),
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '내정보',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('닉네임', style: TextStyle(fontSize: 11),),
                          makeOptionsBox('Lamu_01'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('이메일', style: TextStyle(fontSize: 11),),
                          makeOptionsBox('manuna530@gmail.com'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('휴대폰 번호', style: TextStyle(fontSize: 11,),),
                          makeOptionsBox('010-2998-7438'),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('소개', style: TextStyle(fontSize: 11),),
                          makeOptionsBox('나를 소개해주세요'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '공개 범위',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: CustomStepper(),
                    )
                  ],
                ),
              )
            ],
          ),
        )
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
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(25, 30),
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // ???
                  },
                  child: Text(
                    '변경',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                )

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