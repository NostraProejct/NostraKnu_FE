import 'package:flutter/material.dart';

class ActivityTotal extends StatefulWidget {
  const ActivityTotal({super.key});

  @override
  State<ActivityTotal> createState() => _ActivityTotalState();
}

class _ActivityTotalState extends State<ActivityTotal> {
  int _currentStep = 0; // 현재 스텝을 추적하기 위한 정수 변수 초기화
  final ScrollController _scrollController = ScrollController();
  // ScrollController 추가
  @override
  void dispose() {
    _scrollController.dispose(); // ScrollController 해제,
    // 위젯이 소멸할때 dispose 하지 않으면 ScrollController가 시스템 자원을 점유한다
    super.dispose(); // dispose()호출하여 정리
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.orange, // 기본 색상 설정
          ),
        ),
        child: Padding(
            padding: EdgeInsets.only(right: 8),
          child: RawScrollbar( // Scrollerbar 스타일
            controller: _scrollController, // ScrollController 연결
            thumbVisibility: true, // 스크롤바 항상 표시
            trackVisibility: true, // 트랙 표시 여부
            thickness: 6  , // 스크롤바 두께
            radius: const Radius.circular(10), // 스크롤바 끝 모서리 둥글게
            thumbColor: Colors.black, // 스크롤바 색상
            trackColor: Colors.grey.shade200, // 트랙 색상
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20), // 오른쪽 여백 추가
                    child: Stepper(
                      physics: const NeverScrollableScrollPhysics(),
                      // RawScrollBar와 Stepper의 스크롤이 겹쳐 Stepper의 스크롤 막기,
                      type: StepperType.vertical, // stepper 수직으로 배치
                      currentStep: _currentStep, // 현재 활성화된 스텝(_currentStep)설정
                      onStepTapped: (int step) { // 스탭을 탭했을때 호출되는 콜백 함수
                        setState(() {
                          _currentStep = step; // currentStep 업데이트
                        });
                      },
                      steps: List.generate(
                        50, // 총 50개의 스텝 생성
                            (index) => Step(
                          title: Text('전체 ${index + 1}'), // 목록 제목
                          content: Text('전체 ${index + 1} 내용'), // 내용
                          isActive: _currentStep == index, // 현재 활성화 단계가 _currentStep과 동일하면 활성화
                        ),
                      ),
                      controlsBuilder: (BuildContext context, ControlsDetails details) {
                        return const SizedBox.shrink(); // Cancel, Continue 버튼 숨김
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
