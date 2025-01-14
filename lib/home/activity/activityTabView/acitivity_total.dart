import 'package:flutter/material.dart';

class ActivityTotal extends StatefulWidget {
  const ActivityTotal({super.key});

  @override
  State<ActivityTotal> createState() => _ActivityTotalState();
}

class _ActivityTotalState extends State<ActivityTotal> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.orange,
        ),
      ),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          onStepTapped: (int step) {
            setState(() {
              _currentStep = step;
            });
          },
          steps: [
            Step(
              title: const Text('전체 1'),
              content: const Text('전체 1 내용'),
              isActive: _currentStep == 0
            ),
            Step(
              title: const Text('전체 2'),
              content: const Text('전체 2 내용'),
                isActive: _currentStep == 1
            ),
            Step(
              title: const Text('전체 3'),
              content: const Text('전체 3 내용'),
                isActive: _currentStep == 2
            ),
            Step(
                title: const Text('전체 4'),
                content: const Text('전체 4 내용'),
                isActive: _currentStep == 3
            ),
            Step(
                title: const Text('전체 5'),
                content: const Text('전체 5 내용'),
                isActive: _currentStep == 4
            ),
            Step(
                title: const Text('전체 6'),
                content: const Text('전체 6 내용'),
                isActive: _currentStep == 5
            ),
            Step(
                title: const Text('전체 7'),
                content: const Text('전체 7 내용'),
                isActive: _currentStep == 6
            ),
            Step(
                title: const Text('전체 8'),
                content: const Text('전체 8 내용'),
                isActive: _currentStep == 7
            ),
            Step(
                title: const Text('전체 9'),
                content: const Text('전체 9 내용'),
                isActive: _currentStep == 8
            ),
            Step(
                title: const Text('전체 10'),
                content: const Text('전체 10 내용'),
                isActive: _currentStep == 9
            ),
          ],
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return SizedBox.shrink(); //cacel, continue 버튼 숨기기
          },
          // onStepContinue: () {}, // continue 버튼 생략
          // onStepCancel: () {}, // concal 버튼 생략
        ),
      ),
    );
  }
}
