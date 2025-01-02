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
