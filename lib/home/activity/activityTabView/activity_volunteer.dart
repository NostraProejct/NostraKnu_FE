import 'package:flutter/material.dart';

class ActivityVolunteer extends StatefulWidget {
  const ActivityVolunteer({super.key});

  @override
  State<ActivityVolunteer> createState() => _ActivityVolunteerState();
}

class _ActivityVolunteerState extends State<ActivityVolunteer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('봉사활동 페이지'),
    );
  }
}
