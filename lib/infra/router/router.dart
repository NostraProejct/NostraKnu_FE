import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../community/list/communityList.dart';
import '../../community/list/title/communityListTitle.dart';
import '../../community/main/communityMain.dart';
import '../../home/home_screen.dart';
import '../../home/notice/noticeMain.dart';
import '../../home/notice/title/notice_title.dart';
import '../../home/mainpage.dart';

// 임시 페이지 (학식, 대외활동, 취업)
class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          '$title 페이지 준비 중',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// GoRouter 설정
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        if (state.fullPath == '/home/notice') {
          return MainPage(
            customTitle: NoticeTitleWidget(), // 커스텀 제목
            customBackgroundColor: Colors.white, // 커스텀 배경색
            child: child,
          );
        }
        if (state.fullPath == '/community/list') {
          return MainPage(
            customTitle: CommunityListTitle(), // 커스텀 제목
            customBackgroundColor: Colors.white, // 커스텀 배경색
            child: child,
          );
        }
        return MainPage(child: child);
      },
      routes: [
        // 홈 창
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              _customTransitionPage(HomeScreen()),
          // 홈창 하위 페이지
          routes: [
            GoRoute(
              path: 'notice',
              pageBuilder: (context, state) => MaterialPage(
                child: NoticeMain(), // 공지사항 페이지 연결
              ),
            ),
            GoRoute(
              path: 'cafeteria',
              pageBuilder: (context, state) => _customTransitionPage(
                PlaceholderPage(title: '학식'),
              ),
            ),
            GoRoute(
              path: 'activities',
              pageBuilder: (context, state) => _customTransitionPage(
                PlaceholderPage(title: '대외활동'),
              ),
            ),
            GoRoute(
              path: 'employment',
              pageBuilder: (context, state) => _customTransitionPage(
                PlaceholderPage(title: '취업'),
              ),
            ),
          ],
        ),
        // 맵 창
        GoRoute(
          path: '/map',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              _customTransitionPage(Text("맵 화면 준비 중")),
        ),
        // 커뮤니티 창
        GoRoute(
          path: '/community',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              _customTransitionPage(CommunityMain()),
          routes: [
            GoRoute(
              path: 'list',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  _customTransitionPage(CommunityList()),
            ),
          ],
        ),
        // 설정 창
        GoRoute(
          path: '/settings',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              _customTransitionPage(Text("설정 화면 준비 중")),
        ),
      ],
    ),
  ],
);

CustomTransitionPage _customTransitionPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondaryAnimation,
        Widget child,
        ) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1.25, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      );
    },
  );
}
