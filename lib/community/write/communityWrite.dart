import 'package:flutter/material.dart';

class CommunityWrite extends StatefulWidget {
  const CommunityWrite({super.key});

  @override
  State<CommunityWrite> createState() => _CommunityWrite();
}

class _CommunityWrite extends State<CommunityWrite> {
  List<String> dropDownList = ['정보 게시판', '취업ㆍ진로 게시판', '대외활동 게시판'];
  String dropdownValue = '정보 게시판';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF5F2),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 17, bottom: 3),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButton(
                      elevation: 6,
                      icon: Icon(Icons.keyboard_arrow_down),
                      style: const TextStyle(color: Colors.black),
                      value: dropdownValue,
                      items: dropDownList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!; // 선택된 값을 업데이트
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 370,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:7, left: 3, right: 7),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('제목을 입력하세요', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3, top: 7),
                        child: Container(
                          height: 26,
                          decoration: BoxDecoration(
                              color: Color(0xFFFAF5F2),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          alignment: Alignment.center,
                          child: TextField(
                            maxLength: 32,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                                hintText: '제목 입력하기',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 12)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 370,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 80,
                width: 370,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:10, left: 3, right: 7, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('내용을 입력하세요', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, top: 7),
                      child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAF5F2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          maxLines: null,
                          minLines: 10,
                          decoration: InputDecoration(
                            hintText: '게시글을 입력하세요...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFFAF5F2),
                            contentPadding: EdgeInsets.all(16),
                          ),
                        )

                      ),
                    )

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 17),
              width: 370,
              height: 172,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
