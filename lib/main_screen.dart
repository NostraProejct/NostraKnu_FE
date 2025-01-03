import 'package:flutter/material.dart';

import 'home/mainpage.dart';

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
//2024/9/09 김동준 github연결