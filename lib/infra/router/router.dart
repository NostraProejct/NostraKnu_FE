import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../community/list/communityList.dart';
import '../../community/main/communityMain.dart';
import '../../home/home_screen.dart';
import '../../home/mainpage.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CustomTransitionPage(
                child: HomeScreen(),
                transitionsBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,
                    ) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) => Center(child: Text("Map Screen")),
        ),
        GoRoute(
          path: '/community',
          builder: (context, state) => CommunityMain(),
          routes: [
            GoRoute(
              path: 'list',
              builder: (context, state) => CommunityList(),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => Center(child: Text("Setting Screen")),
        ),
      ],
    ),
  ],
);