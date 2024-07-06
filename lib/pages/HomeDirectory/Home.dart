import 'package:flutter/material.dart';
import 'package:nostra/pages/HomeDirectory/Home_recommend.dart';
import 'package:nostra/pages/HomeDirectory/Home_popular.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Text('Nostra', style: TextStyle(fontFamily: 'ConcertOneRegular', fontSize: 28)),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: const [
          Expanded(child: BodyPage())
        ],
      ),
    );
  }
}

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  Widget bodyPage = HomeRecommend();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bodyPage,
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Align(
            alignment: Alignment(0.0 , -0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => setState(() => bodyPage = const HomeRecommend()),
                    child: const Text("Recommend", style: TextStyle(
                        fontFamily: 'ConcertOneRegular', color: Colors.black, fontSize: 23))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                  child: TextButton(
                      onPressed: () => setState(() => bodyPage = const HomePopular()),
                      child: const Text("Popular", style: TextStyle(
                          fontFamily: 'ConcertOneRegular', color: Colors.black, fontSize: 23))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
