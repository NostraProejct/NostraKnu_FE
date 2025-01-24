import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CafeteriaMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CafeteriaMain();
  }
}

class _CafeteriaMain extends State<CafeteriaMain> {
  final List<String> locations = ['새롬관', '이룸관', '천지관', '백록관', '현권관'];
  final List<List<String>> menus = [
    ['밥 된장국\n제육볶음\n계란말이', '계란볶음밥 미소된장국\n닭볶음탕\n멸치볶음', '밥 김치찌개', '밥 돈까스', '밥 불고기'],
    [
      '백미밥 고추장시금치국\n간장순살찜닭 수제김치전\n숙주나물무침 깍두기',
      '쌀국수 사모사\n열대과일샐러드 궁채장아찌\n배추김치',
      '꼬막비빔밥 유부장국\n단호박고로케*케찹 요구르트\n배추김치',
      '백미밥 들깨수제비국\n두루치기 양배추찜*쌈장\n도토리묵무침 깍두기',
      '백미밥 얼큰동태탕\n계란옷입은동그랑땡 비엔나떡조림\n양념깻잎지 깍두기'
    ],
    [
      '참치김치찌개 닭고기두반장조림\n베이컨스크램블에그 참나물도토리묵무침\n딸리양상추샐럿 포기김치 누룽지탕',
      '돈주물럭불고기 북어채콩나물국\n부추돈육잡채 다시마채초고추장무침\n멕시칸샐럿 포기김치 누룽지탕',
      '사골우거지탕 시래기동태무조림\n굴소스우동볶음 물파래무무침\n천사채게맛살샐럿 깍두기 누룽지탕',
      '돌솥제육비빔밥 양지미역국\n수수부꾸미 골뱅이비빔국수\n만다린과일샐럿 포기김치 누룽지탕',
      '뚝배기안동찜닭 쑥갓꼬치어묵탕\n검은깨오징어가스*크리미 무말랭이고춧잎무침\n고구마단호박샐럿 포기김치 누룽지탕'
    ],
    ['밥 삼계탕', '밥 떡볶이', '밥 생선구이', '밥 불고기', '밥 불고기'],
    ['밥 치킨', '밥 고등어조림', '밥 된장찌개', '밥 불고기', '밥 불고기'],
  ];

  final List<List<String>> dinnerMenus = [
    ['밥 된장국\n제육볶음\n계란말이', '계란볶음밥 미소된장국\n닭볶음탕\n멸치볶음', '밥 김치찌개', '밥 돈까스', '밥 불고기'],
    [
      '카레라이스 어묵탕\n새우가스*케찹 오복채무침\n배추김치',
      '백미밥 참치김치찌개\n갈릭떡갈비강정 고추장메추리알조림\n매콤호박볶음 깍두기',
      '백미밥 계란파국\n짬뽕불고기 톳두부무침\n알감자조림 깍두기',
      '베이컨김치볶음밥 우동장국\n타코야끼 음료\n깍두기',
      '백미밥 얼갈이된장국\n두루치기 견과류멸치볶음\n파래무우무침 배추김치'
    ],
  ];

  PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  final Map<String, ScrollController> _scrollControllers = {};
  final Map<String, bool> _showArrows = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < locations.length; i++) {
      for (int j = 0; j < menus[i].length; j++) {
        final key = '${i}_$j';
        _scrollControllers[key] = ScrollController()
          ..addListener(() {
            setState(() {
              // 스크롤이 맨 위에 있을 때만 화살표 표시
              _showArrows[key] = _scrollControllers[key]!.position.maxScrollExtent > 0 &&
                  _scrollControllers[key]!.offset <= 0;
            });
          });
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _scrollControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
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
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        iconSize: 26,
        onPressed: () => context.pop(),
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        _buildPageView(),
        if (currentIndex > 0) _buildLeftArrow(),
        if (currentIndex < locations.length - 1) _buildRightArrow(),
        _buildPageIndicator(),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: locations.length,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: menus[index].length,
                itemBuilder: (context, menuIndex) {
                  final key = '${index}_$menuIndex';
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 28.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDateBox(menuIndex),
                        _buildMenuBox(index, menuIndex, key),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDateBox(int menuIndex) {
    return Container(
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
              '10.${menuIndex + 7}',
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
              ['MON', 'TUE', 'WED', 'THU', 'FRI'][menuIndex],
              style: TextStyle(
                fontSize: 19,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBox(int index, int menuIndex, String key) {
    return Expanded(
      child: Container(
        height: 120,
        padding: EdgeInsets.only(left: 13, top: 13, right: 13, bottom: 4),
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final textSpan = TextSpan(
              text: menus[index][menuIndex],
              style: TextStyle(
                color: Colors.black87,
                height: 1.75,
                fontSize: 16.9,
                fontWeight: FontWeight.w500,
              ),
            );
            final textPainter = TextPainter(
                text: textSpan,
                textDirection: TextDirection.ltr,
                maxLines: null
            );
            textPainter.layout(maxWidth: constraints.maxWidth);

            // 실제로 스크롤이 필요한지 확인
            final hasOverflow = textPainter.height > (constraints.maxHeight - 28);

            _scrollControllers[key]?.addListener(() {
              final isAtTop = _scrollControllers[key]!.offset <= 0;
              final shouldShowArrow = hasOverflow && isAtTop;

              if (_showArrows[key] != shouldShowArrow) {
                setState(() {
                  _showArrows[key] = shouldShowArrow;
                });
              }
            });

            return Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollControllers[key],
                  child: Text(
                    menus[index][menuIndex],
                    style: TextStyle(
                      color: Colors.black87,
                      height: 1.7,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (_showArrows[key] ?? false)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                      size: 26,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLeftArrow() {
    return Positioned(
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
    );
  }

  Widget _buildRightArrow() {
    return Positioned(
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
    );
  }

  Widget _buildPageIndicator() {
    return Positioned(
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
    );
  }
}