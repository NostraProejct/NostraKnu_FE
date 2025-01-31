import 'package:flutter/material.dart';

class CafetriaSection extends StatelessWidget {
  final VoidCallback onTap;

  const CafetriaSection({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 50) / 2,
            height: 180,
            decoration: BoxDecoration(
              color: const Color(0xFFC1EBE9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 56.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '학식',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                        )
                      ),
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
                          color: Color(0xFFA9D1D6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 55.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MON',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '10.7',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Text(
                          '백미밥 고추장시금치국\n간장순살찜닭 수제김치전\n숙주나물무침 깍두기',
                          style: TextStyle(
                            color: Colors.black,
                            height: 1.65,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 아이콘과 텍스트의 크기를 최소화
                      children: [
                        Icon(Icons.keyboard_arrow_right, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}