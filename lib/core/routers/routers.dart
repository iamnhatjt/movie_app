import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/base_navigator.dart';
import 'package:movie_app/core/service/di.dart';
import 'package:movie_app/core/utils/app_const.dart';
import 'package:movie_app/features/main_page/presentation/pages/detail_movie_page.dart';
import 'package:movie_app/features/main_page/presentation/pages/home_page.dart';
import 'package:movie_app/features/main_page/presentation/pages/page_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/login/presentation/pages/authentication_pages.dart';

class RouterDerection {
  static String login = '/login';
  static String home = '/';
  static String pageMovie = '/pageMovie';

  static String detail(String slug) => '/detail/$slug';
}

final router = GoRouter(
  redirect: (context, state) {
    if (getIt<SharedPreferences>().getBool(AppConst.isLoginSharePreferences) ==
        true) {
      return null;
    }
    return RouterDerection.login;
  },
  routes: [
    ShellRoute(
        navigatorKey: getIt<GlobalKey<NavigatorState>>(),
        builder: (context, state, child) {
          return BaseNavigator(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouterDerection.home,
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: RouterDerection.pageMovie,
            builder: (context, state) {
              return const PageMovieScreen();
            },
          ),
        ]),
    GoRoute(
      path: RouterDerection.login,
      builder: (context, state) => const AuthenticaitonPage(),
    ),
    GoRoute(
      path: RouterDerection.detail(':slug'),
      builder: (context, state) =>
          DetailMoviePage(slug: state.pathParameters['slug'] ?? ''),
    ),
  ],
  debugLogDiagnostics: true,
);
