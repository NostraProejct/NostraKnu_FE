import 'package:flutter/material.dart';

class CommunityTitle extends StatelessWidget {
  const CommunityTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'KNU',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '커뮤니티',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}