import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CafeteriaMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CafeteriaMain();
  }
}

class _CafeteriaMain extends State<CafeteriaMain> {

  final List<String> locations = ['새롬관', '이룸관', '동준관', '영호관', '현권관'];
  final List<List<String>> menus = [
    ['밥 제육 된장', '밥 닭볶음탕', '밥 불고기', '밥 불고기', '밥 불고기'],
    ['밥 갈비탕', '밥 오징어볶음', '밥 김치찌개', '밥 불고기', '밥 불고기'],
    ['밥 돈까스', '밥 순두부찌개', '밥 비빔밥', '밥 불고기', '밥 불고기'],
    ['밥 삼계탕', '밥 떡볶이', '밥 생선구이', '밥 불고기', '밥 불고기'],
    ['밥 치킨', '밥 고등어조림', '밥 된장찌개', '밥 불고기', '밥 불고기'],
  ];

  PageController _pageController = PageController(initialPage: 0); // 슬라이드 기능용
  int currentIndex = 0; // 현재 학식관 인덱스

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Text(
          locations[currentIndex],
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          iconSize: 26,
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          // PageView로 학식관 전환
          PageView.builder(
            controller: _pageController,
            itemCount: locations.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index; // 현재 인덱스 업데이트
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: menus[index].length,
                      itemBuilder: (context, menuIndex) {
                        return Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 28.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 날짜 박스
                              Container(
                                width: 75,
                                height: 120,
                                margin: EdgeInsets.only(right: 10.0),
                                padding: EdgeInsets.only(top: 18.0),
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
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        '10.${menuIndex + 7}', // 임의의 날짜
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: Text(
                                        ['MON', 'TUE', 'WED', 'THU', 'FRI']
                                        [menuIndex],
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
                              // 메뉴 박스
                              Expanded(
                                child: Container(
                                  height: 120,
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
                                    menus[index][menuIndex], // 메뉴 데이터
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          // 왼쪽 화살표
          if (currentIndex > 0)
            Positioned(
              left: -5,
              top: MediaQuery.of(context).size.height / 2 - 115,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          // 오른쪽 화살표
          if (currentIndex < locations.length - 1)
            Positioned(
              right: -10,
              top: MediaQuery.of(context).size.height / 2 - 115,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          // 하단 점 네비게이션
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                locations.length,
                    (index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.black
                        : Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
