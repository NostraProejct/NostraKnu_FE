import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 0;

  List<Step> makeSteps() {
    return [
      Step(
        title: Text(
          '비공개',
          style: TextStyle(
            color: currentStep == 0 ? Colors.black : Colors.white38,
            fontSize: 14,
          ),
        ),
        content: SizedBox.shrink(),
        isActive: currentStep != 0,
      ),
      Step(
        title: Text(
          '친구만',
          style: TextStyle(
            color: currentStep == 1 ? Colors.black : Colors.white38,
            fontSize: 14,
          ),
        ),
        content: SizedBox.shrink(),
        isActive: currentStep != 1,
      ),
      Step(
        title: Text(
          '모두',
          style: TextStyle(
            color: currentStep == 2 ? Colors.black : Colors.white38,
            fontSize: 14,
          ),
        ),
        content: SizedBox.shrink(),
        isActive: currentStep != 2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      height: 100,
      child: Stepper(
        steps: makeSteps(),
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepTapped: (int index) {
          setState(() => currentStep = index);
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return SizedBox.shrink();
        },
      ),
    );
  }
}