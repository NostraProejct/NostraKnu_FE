import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityWrite extends StatefulWidget {
  @override
  State<CommunityWrite> createState() => _CommunityWrite();
}

class _CommunityWrite extends State<CommunityWrite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Write'),
      ),
      body: Center(
        child: Text('Write your content here!'),
      ),
    );
  }
}
