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
        children: [
          Container(
            width: isFullWidth
                ? double.infinity
                : (MediaQuery.of(context).size.width - 50) / 2,
            height: 180,
            decoration: BoxDecoration(
              color: Color(0xFFDBDDF4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 56.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('대외활동',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                    child: Container(
                        width: 32.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFC2C4E6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.auto_graph,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.0, top: 123.0),
                    child: Column(
                      children: const [
                        Text("나만을 위한 대외활동", style: TextStyle(
                          fontSize: 12, color: Color(0xFF495057)),
                        ),
                        SizedBox(height: 3),
                        Text("확인하기", style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Image(
                      image: AssetImage("assets/images/activity.png"),
                      width: 65.0,
                      height: 65.0,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.keyboard_arrow_right, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
