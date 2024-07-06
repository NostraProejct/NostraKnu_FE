import 'package:flutter/material.dart';


class HomePopular extends StatelessWidget {
  const HomePopular({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SingleChildScrollView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SingleChildScrollView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 300,
                width: 360,
                color: Colors.amberAccent,
              ),
              Container(
                height: 300,
                width: 360,
                color: Colors.blueAccent,
              ),
              Container(
                height: 300,
                width: 360,
                color: Colors.redAccent,
              ),
              Container(
                height: 300,
                width: 360,
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}