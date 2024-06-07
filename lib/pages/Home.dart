import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child:
          Text('Nostra', style: TextStyle(fontFamily: 'ConcertOneRegular')),

      ),
    );
  }
}
