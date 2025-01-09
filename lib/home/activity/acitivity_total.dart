import 'package:flutter/material.dart';

class ActivityTotal extends StatefulWidget {
  const ActivityTotal({super.key});

  @override
  State<ActivityTotal> createState() => _ActivityTotalState();
}

class _ActivityTotalState extends State<ActivityTotal> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Column(
              children: List.generate(6, (index) {
                final bool isSelected = index == selectedindex;
                return GestureDetector(
                   onTap: () {
                     setState(() {
                       selectedindex = index;
                     });
                   },
                  child: _buildTimelineItem(isSelected),
                );
              }),
            ),
          )
        ),

    );
  }

  Widget _buildTimelineItem(bool isSelected) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 25),
        Column(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange : Colors.grey[300],
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.white, // 테두리 색상
                  width: 4, // 테두리 두께
                )
              ),
            ),
            Container(
              width: 2,
              height: 70,
              color: Colors.grey[300],
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
