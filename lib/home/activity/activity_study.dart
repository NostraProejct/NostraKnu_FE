import 'package:flutter/material.dart';

class ActivityStudy extends StatefulWidget {
  const ActivityStudy({super.key});

  @override
  State<ActivityStudy> createState() => _ActivityStudyState();
}

class _ActivityStudyState extends State<ActivityStudy> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('스터디 페이지'),
    );
  }
}
