import 'package:flutter/material.dart';
class ActivityClub extends StatefulWidget {
  const ActivityClub({super.key});

  @override
  State<ActivityClub> createState() => _ActivityClubState();
}

class _ActivityClubState extends State<ActivityClub> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('동아리 페이지'),
    );
  }
}
