import 'package:flutter/material.dart';

class SettingTitleWidget extends StatelessWidget {
  const SettingTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child:
      Text(
        '메뉴',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight:FontWeight.bold,
        ),
      ),
    );
  }
}