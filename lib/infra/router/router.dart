import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nostra/community/write/communityWrite.dart';

import '../../community/list/communityList.dart';
import '../../community/list/title/communityListTitle.dart';
import '../../community/main/communityMain.dart';
import '../../home/home_screen.dart';
import '../../home/placeholderPage.dart';
import '../../home/notice/noticeMain.dart';
import '../../home/notice/title/notice_title.dart';
import '../../home/mainpage.dart';

// GoRouter 설정
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        if (state.fullPath == '/notice') {
          return MainPage(
            customTitle: NoticeTitleWidget(), // 커스텀 제목
            customBackgroundColor: Colors.grey[200], // 커스텀 배경색
            child: child,
          );
        }
        if (state.fullPath == '/community/list/write') {
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
                child: NoticeMain(), // 공지사항
              ),
            ),
            GoRoute(
              path: 'cafeteria',
              pageBuilder: (context, state) => MaterialPage(
                child: PlaceholderPage(title: '학식'), // 학식
              ),
            ),
            GoRoute(
              path: 'activities',
              pageBuilder: (context, state) => MaterialPage(
                child: PlaceholderPage(title: '대외활동'), // 대외활동
              ),
            ),
            GoRoute(
              path: 'employment',
              pageBuilder: (context, state) => MaterialPage(
                child: PlaceholderPage(title: '취업'), // 취업
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
              routes: [
                GoRoute(
                  path: 'write',
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      _customTransitionPage(CommunityWrite()),
                ),
              ]
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
            begin: const Offset(0, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      );
    },
  );
}
