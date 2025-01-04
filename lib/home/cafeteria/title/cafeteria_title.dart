import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CafeteriaTitleWidget extends StatelessWidget {
  const CafeteriaTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          iconSize: 26,
          onPressed: () => context.pop(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 115.0, top: 9.5),
          child: Text(
            '학식',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
        ),
      ],
    );
  }
}