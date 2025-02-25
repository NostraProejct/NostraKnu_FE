import 'package:flutter/material.dart';

class ActivitySection extends StatelessWidget {
  final bool isFullWidth;
  final VoidCallback onTap;

  const ActivitySection({this.isFullWidth = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.list, color: Colors.black),
              SizedBox(width: 4),
              Text(
                '대외활동',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            width: isFullWidth ? double.infinity : (MediaQuery.of(context).size.width - 50) / 2,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }
}