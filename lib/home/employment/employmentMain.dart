import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nostra/home/employment/promoSlider.dart';

import 'employmentList.dart';

class EmploymentMain extends StatefulWidget {
  const EmploymentMain({super.key});

  @override
  State<EmploymentMain> createState() => _EmploymentMainState();
}

class _EmploymentMainState extends State<EmploymentMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        iconSize: 20,
        onPressed: () => context.pop(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(child: SizedBox(),
          ),
          Icon(Icons.search_rounded, color: Color(0xFF919191)),
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                color: const Color(0xFFE3D5CA),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 1)),
                ],
              ),
            ),
            Positioned(
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 8.0, top: 25.0),
                      child: Text(
                        '"현권" 님을 위한',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0,),
                      child: Text(
                        '추천 취업 리스트',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
            ),
            Positioned(
              top: 120, // 문장 아래에 위치하도록 조정
              left: 0,
              right: 0,
              child: PromoSlider(), // PromoSlider 위젯 추가
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "취업 리스트",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                width: 200,
              ),
              TextButton(
                onPressed: () {
                  debugPrint("TextButton pressed");
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('더 보기'),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 1))
                          ]),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.black12,
                              size: 40,
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Item ${index + 1}',
                            style: TextStyle(fontSize: 18),),
                          ))
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
