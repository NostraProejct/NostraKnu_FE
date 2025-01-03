import 'package:flutter/material.dart';
import 'infra/router/router.dart';

void main() {
  runApp(const Nostra());
}

class Nostra extends StatelessWidget {
  const Nostra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Nostra",
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: Colors.white, // 기본 색상
          background: Colors.white, // 배경 색상
          onBackground: Colors.black, // 배경 위 텍스트 색상
        ),
      ),
      routerConfig: router,
    );
  }
}