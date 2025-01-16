import 'package:flutter/material.dart';

class EmploymentSection extends StatelessWidget {
  final VoidCallback onTap;

  const EmploymentSection({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              SizedBox(width: 2),
              Icon(Icons.list, color: Colors.black),
              SizedBox(width: 4),
              Text(
                '취업',
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
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobListItem(
                    company: '(주)우아한형제들',
                    position: '각 부문별 경력/신입 인재영입',
                  ),
                  Divider(color: Colors.grey[600], thickness: 1, height: 1),
                  JobListItem(
                    company: '(주)우아한형제들',
                    position: '각 부문별 경력/신입 인재영입123456789',
                  ),
                  Divider(color: Colors.grey[600], thickness: 1, height: 1),
                  JobListItem(
                    company: '(주)우아한형제들',
                    position: '각 부문별 경력/신입 인재영입',
                  ),
                  Divider(color: Colors.grey[600], thickness: 1, height: 1),
                  JobListItem(
                    company: '(주)우아한형제들',
                    position: '각 부문별 경력/신입 인재영입',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JobListItem extends StatelessWidget {
  final String company;
  final String position;

  const JobListItem({
    required this.company,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Text(
            company,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              position,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}