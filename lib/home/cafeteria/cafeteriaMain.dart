import 'package:flutter/material.dart';

class CafeteriaMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CafeteriaMain();
  }
}

class _CafeteriaMain extends State<CafeteriaMain> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              height: 110,
                              margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
                              padding: EdgeInsets.all(18.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      '10.07',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      'MON',
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 270,
                              height: 110,
                              margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
                              padding: EdgeInsets.all(13.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: Text(
                                '밥 제육 된장',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // 페이지네이션 바
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('dot'),
                Text('dot'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

