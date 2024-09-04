import 'package:flutter/material.dart';
import 'package:nostra/mainpage.dart';

void main() {
  runApp(const Nostra());
}
class Nostra extends StatelessWidget {
  const Nostra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nostra",
      home: MainPage(),
    );
  }
}
// 실험 주석 추가
//2024/9/04 Girhub 추가 확인하기, 각자 웹후크 연결하기
