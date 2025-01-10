import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({super.key});

  @override
  State<DropDownPage> createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  String dropDownValue = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }

  Widget _buildArea() {
    List<String> dropDownList = ['1', '2', '3'];

    if (dropDownList.isEmpty) {
      return Text("선택 가능한 값이 없습니다.");
    }

    return DropdownButton(
      value: dropDownValue,
      items: dropDownList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          dropDownValue = value!;
          print(dropDownValue);
        });
      },
    );
  }

}