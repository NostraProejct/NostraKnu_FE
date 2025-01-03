import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../community/list/communityList.dart';
import '../../community/list/title/communityListTitle.dart';
import '../../community/main/communityMain.dart';
import '../../home/home_screen.dart';
import '../../home/mainpage.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        if (state.fullPath == '/community/list') {
          return MainPage(
            customTitle: CommunityListTitle(), // CommunityList용 커스텀 제목
            customBackgroundColor: Colors.white, // CommunityList용 배경색
            child: child,
          );
        }
        return MainPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              _customTransitionPage(HomeScreen()),
        ),
        GoRoute(
          path: '/map',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              _customTransitionPage(Text("hello map")),
        ),
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
        GoRoute(
          path: '/settings',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              _customTransitionPage(Text("hello Setting")),
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
      // 애니메이션 없이 바로 전환되도록 child만 반환
      return child;
    },
  );
}
