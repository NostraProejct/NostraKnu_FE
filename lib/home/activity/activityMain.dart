import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'activityTabView/acitivityTotal.dart';
import 'activityTabView/activityClub.dart';
import 'activityTabView/activityCompetition.dart';
import 'activityTabView/activityVolunteer.dart';
import 'activityTabView/activityStudy.dart';

class ActivityMain extends StatefulWidget {
  const ActivityMain({super.key});
//test
  @override
  State<ActivityMain> createState() => _ActivityMainState();
}

class _ActivityMainState extends State<ActivityMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // TabController
  final List<String> tabTitles = ['전체', '동아리', '대회', '봉사', '스터디'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabTitles.length, vsync: this); // TabController 초기화
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController 메모리 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        iconSize: 20,
        onPressed: () => context.pop(),
      ),
      title: const Text('대외활동'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {
            print("Search button clicked");
          },
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50), // 바텀 영역 크기
        child: Container(
          color: Colors.white, // AppBar 하단 배경색
          padding: const EdgeInsets.symmetric(horizontal: 8), //여백
          child: TabBar(
            dividerColor: Colors.white,
            controller: _tabController,
            labelColor: Colors.black, // 선택된 탭 텍스트 색상
            unselectedLabelColor: Colors.grey, // 선택되지 않은 탭 텍스트 색상
            unselectedLabelStyle: const TextStyle(fontSize: 15), // 선택되지 않은 탭 텍스트 스타일
            labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold), // 선택된 탭 텍스트 스타일
            tabs: tabTitles.map((title) {
              return Tab(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // 선택되지 않은 탭 배경색
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Text(title)), // 탭 제목
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: _tabController,
      children: const [
        ActivityTotal(),
        ActivityClub(),
        ActivityCompetition(),
        ActivityVolunteer(),
        ActivityStudy(),
      ],
    );
  }
}