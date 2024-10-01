import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/shared_export.dart';
import 'package:flutter_clean_architecture/core/notifier/auth_notifier.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/home/cubit/home_cubit.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/home/home_page.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/profile/cubit/profile_cubit.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/profile/profile_page.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/settings/cubit/settings_cubit.dart';
import 'package:flutter_clean_architecture/features/bottom_navigation/settings/settings_screen.dart';
import 'package:flutter_clean_architecture/features/login/cubit/login_cubit.dart';
import 'package:flutter_clean_architecture/features/login/login_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class ScreenPaths {
  static const home = '/';
  static const profile = '/profile';
  static const settings = '/settings';
  static const login = '/login';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: ScreenPaths.home,
  navigatorKey: _rootNavigatorKey,
  refreshListenable: authNotifier,
  redirect: (context, state) {
    if (authNotifier.status == AuthStatus.notAuthenticated) {
      return ScreenPaths.login;
    }
    if (authNotifier.status == AuthStatus.authenticated && state.matchedLocation == ScreenPaths.login) {
      return ScreenPaths.home;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: ScreenPaths.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(authUseCases),
        child: const LoginScreen(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => BottomNavigationPage(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ScreenPaths.home,
              builder: (context, state) => BlocProvider(
                create: (context) => HomeCubit(homeUseCases),
                child: const HomePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ScreenPaths.profile,
              builder: (context, state) => BlocProvider(
                create: (context) => ProfileCubit(profileUseCases),
                child: const ProfilePage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ScreenPaths.settings,
              builder: (context, state) => BlocProvider(
                create: (context) => SettingsCubit(),
                child: const SettingsScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
