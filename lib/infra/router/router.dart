import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nostra/community/detail/communityDetail.dart';

import 'package:nostra/community/write/communityWrite.dart';
import 'package:nostra/setting/manageProfile/settingManage.dart';
import 'package:nostra/setting/settingPage.dart';

import '../../community/list/communityList.dart';
import '../../community/main/communityMain.dart';

import '../../home/home_screen.dart';
import '../../home/notice/noticeMain.dart';
import '../../home/notice/noticeDetail.dart';
import '../../home/cafeteria/cafeteriaMain.dart';
import '../../home/employment/employmentMain.dart';
import '../../home/activity/activityMain.dart';
import '../../home/mainpage.dart';

final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> mapNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> communityNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> settingsNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPage(navigationShell: navigationShell,);
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
                    routes: [
                      GoRoute(
                        path: ':id',
                        pageBuilder: (context, state) {
                          final params = state.extra as Map<String, String>? ?? {};
                          return MaterialPage(
                            child: NoticeDetail(
                              id: params['id'] ?? '알 수 없음',
                              title: params['title'] ?? '알 수 없음',
                              date: params['date'] ?? '알 수 없음',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'cafeteria',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        _customTransitionPage(CafeteriaMain()), // 학식
                  ),
                  GoRoute(
                    path: 'activities',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        _customTransitionPage(ActivityMain()), // 대외활동
                  ),
                  GoRoute(
                    path: 'employment',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        _customTransitionPage(EmploymentMain()), // 취업
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
                  GoRoute(
                    path: 'detailPost',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        _customTransitionPage(CommunityDetail()),
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
                    _customTransitionPage(SettingPage()),
                routes: [
                  GoRoute(
                    path: 'manage',
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        _customTransitionPage(SettingManage()),
                  )
                ],
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