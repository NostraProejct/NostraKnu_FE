import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nostra/community/write/title/CommunityWriteTitle.dart';

class CommunityWrite extends StatefulWidget {
  const CommunityWrite({super.key});

  @override
  State<CommunityWrite> createState() => _CommunityWrite();
}

class _CommunityWrite extends State<CommunityWrite> {
  List<String> dropDownList = ['정보 게시판', '취업ㆍ진로 게시판', '대외활동 게시판'];
  String dropdownValue = '정보 게시판';
  final ImagePicker _picker = ImagePicker();
  List<File> _imageFiles = [];

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _imageFiles.add(File(image.path));
        });
      } else {
        print('이미지 선택이 취소되었습니다.');
      }
    } catch (e) {
      print('이미지 선택 중 오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommunityWriteTitle(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/community/list');
          },
        ),
        backgroundColor: Color(0xFFFAF5F2)
      ),
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
                          dropdownValue = value!;
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
                          borderRadius: BorderRadius.circular(5), // border radius를 5로 줄임
                        ),
                        child: TextField(
                          maxLines: null,
                          minLines: 20,
                          style: TextStyle(fontSize: 11),
                          decoration: InputDecoration(
                            hintText: '게시글을 입력하세요',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none, // 테두리 없애기
                            filled: true,
                            fillColor: Color(0xFFFAF5F2),
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/camera.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
