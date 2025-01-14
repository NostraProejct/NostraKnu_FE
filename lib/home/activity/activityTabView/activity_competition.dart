import 'package:flutter/material.dart';

class ActivityCompetition extends StatefulWidget {
  const ActivityCompetition({super.key});

  @override
  State<ActivityCompetition> createState() => _ActivityCompetitionState();
}

class _ActivityCompetitionState extends State<ActivityCompetition> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('대회 페이지'),
    );
  }
}
