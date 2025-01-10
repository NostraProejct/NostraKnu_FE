import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingLan extends StatefulWidget {
  const SettingLan({super.key});


  @override
  State<StatefulWidget> createState() => _SettingLan();
}

class _SettingLan extends State<SettingLan> {
  String selectedLanguage = '대한민국';

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
                  '글자/언어',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
              '언어',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  makeOptionsBox('대한민국'),
                  const SizedBox(height: 20),
                  makeOptionsBox('English'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Text(
              '글자',
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
                        makeFontMenus('폰트', '/settings/font'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        makeFontMenus('글자 크기/굵기', '/settings/font'),
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
          selectedLanguage = title;
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
                if (selectedLanguage == title)
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

  Widget makeFontMenus(String title, String movePath)  {
    return InkWell(
      onTap: () {
        context.go(movePath);
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
                  padding: EdgeInsets.all(5),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 17,),
                  onPressed: () {
                    context.go(movePath);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 1,
              child: Container(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}