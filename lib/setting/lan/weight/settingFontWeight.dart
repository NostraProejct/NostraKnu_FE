import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingFontWeight extends StatefulWidget {
  const SettingFontWeight({super.key});


  @override
  State<StatefulWidget> createState() => _SettingFontWeight();
}

class _SettingFontWeight extends State<SettingFontWeight> {
  String selectedFontSize = 'Inter';
  String selectedFontWeight = '얇게';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 50),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '글자 크기/굵기',
                  style: TextStyle(fontSize: 20,),
                ),
              ),
            )
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        width: screenWidth,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '글자 크기',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  makeOptionsBox('75%'),
                  const SizedBox(height: 20),
                  makeOptionsBox('100%(권장)'),
                  const SizedBox(height: 20),
                  makeOptionsBox('125%'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text(
              '글자 굵기',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        makeOptionsBoxFontWeight('얇게'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        makeOptionsBoxFontWeight('보통'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        makeOptionsBoxFontWeight('두껍게'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeOptionsBox(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFontSize = title;
        });
      },
      splashColor: Colors.blue.withOpacity(0.3),
      highlightColor: Colors.blue.withOpacity(0.1),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                if (selectedFontSize == title)
                  const Padding(
                    padding: EdgeInsets.only(right: 14),
                    child: Icon(Icons.check, color: Colors.black),
                  )
              ],
            ),
            const SizedBox(
              height: 1,
              child: Divider(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget makeOptionsBoxFontWeight(String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFontWeight = title;
        });
      },
      splashColor: Colors.blue.withOpacity(0.3),
      highlightColor: Colors.blue.withOpacity(0.1),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                if (selectedFontWeight == title)
                  const Padding(
                    padding: EdgeInsets.only(right: 14),
                    child: Icon(Icons.check, color: Colors.black),
                  )
              ],
            ),
            const SizedBox(
              height: 1,
              child: Divider(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}