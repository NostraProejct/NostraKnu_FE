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
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xffebbebf),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.event_available,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65.0, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '취업',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        )
                      ),
                      SizedBox(height: 3),
                      Text(
                        '총 17개의 공고가 있어요',
                        style: TextStyle(
                          color: Color(0xFF495057),
                          fontSize: 13,
                        )
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // 아이콘이 필요한 만큼만 공간 차지
                      children: [
                        Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.black,
                              size: 20,
                            )),
                        SizedBox(width: 15),
                        Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add_circle_outline,
                              color: Colors.black,
                              size: 22,
                            )),
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
                        Text(
                          '공고 확인하기',
                          style: TextStyle(
                            fontSize: 13,
                          )
                        ), // 추가할 텍스트
                        SizedBox(width: 8), // 아이콘과 텍스트 사이 간격
                        Icon(Icons.keyboard_arrow_right, size: 18),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 75.0),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5.0, right: 30.0, bottom: 5.0),
                          child: Column(
                            children: [
                              Text(
                                "프론트앤드",
                                style: TextStyle(
                                  color: Color(0xFF495057),
                                )
                              ),
                              SizedBox(height: 5),
                              Text(
                                "3개",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                )
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 30.0, bottom: 5.0),
                          child: Column(
                            children: [
                              Text(
                                "백앤드",
                                style: TextStyle(
                                  color: Color(0xFF495057),
                                )
                              ),
                              SizedBox(height: 5),
                              Text(
                                "2개",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                )
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 30.0, bottom: 5.0),
                          child: Column(
                            children: [
                              Text(
                                  "AI",
                                  style: TextStyle(
                                      color: Color(0xFF495057)
                                  )
                              ),
                              SizedBox(height: 5),
                              Text(
                                  "7개",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 30.0, bottom: 5.0),
                          child: Column(
                            children: [
                              Text(
                                "보안",
                                style: TextStyle(
                                  color: Color(0xFF495057),
                                )
                              ),
                              SizedBox(height: 5),
                              Text(
                                "5개",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                )
                              )
                            ],
                          ),
                        ),
                      ],
                    )
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