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
import '../../home/cafeteria/cafeteriaMain.dart';
import '../../home/cafeteria/title/cafeteria_title.dart';
import '../../home/mainpage.dart';

final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> mapNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> communityNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> settingsNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        Widget? customTitle;
        Color? customBackgroundColor;

        final location = state.uri.path;

        switch (location) {
          case '/notice':
            customTitle = const NoticeTitleWidget();
            customBackgroundColor = Colors.grey[200];
            break;
          case '/cafeteria':
            customTitle = const CafeteriaTitleWidget();
            customBackgroundColor = Colors.grey[200];
            break;
          case '/community/list/write':
            customTitle = const CommunityListTitle();
            customBackgroundColor = Colors.white;
            break;
        }

        return MainPage(
          navigationShell: navigationShell,
          customTitle: customTitle,
          customBackgroundColor: customBackgroundColor,
        );
      },
      branches: [
        // 홈 창
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  _customTransitionPage(HomeScreen()),
              // 홈창 하위 페이지
              routes: [
                GoRoute(
                  path: 'notice',
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      _customTransitionPage(NoticeMain()), // 공지사항
                ),
                GoRoute(
                  path: 'cafeteria',
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      _customTransitionPage(CafeteriaMain()), // 학식
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
          ]
        ),
        // 맵 창
        StatefulShellBranch(
          navigatorKey: mapNavigatorKey,
          routes: [
            GoRoute(
              path: '/map',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  _customTransitionPage(Text("맵 화면 준비 중")),
            ),
          ]
        ),
        // 커뮤니티 창
        StatefulShellBranch(
          navigatorKey: communityNavigatorKey,
          routes: [
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
          ]
        ),
        // 설정 창
        StatefulShellBranch(
          navigatorKey: settingsNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  _customTransitionPage(Text("설정 화면 준비 중")),
            ),
          ]
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
