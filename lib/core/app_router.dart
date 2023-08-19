import 'dart:convert';

import 'package:flutter_catalog/ui/cart_page.dart';
import 'package:flutter_catalog/ui/home_detail.dart';
import 'package:flutter_catalog/ui/login_page.dart';
import 'package:go_router/go_router.dart';

import '../ui/home_page.dart';
import '../utils/routes.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(
          name: AppRoutes.loginRoute,
          path: "/login",
          builder: (context, state) => LoginPage()),
      GoRoute(
          name: AppRoutes.homeRoute,
          path: "/home",
          builder: (context, state) => HomePage()),
      GoRoute(
          name: AppRoutes.homeDetailRoute,
          path: "/home_detail",
          builder: (context, state) {
            return HomeDetailPage(queryParams: state.queryParams);
          }),

      GoRoute(
          name: AppRoutes.cartRoute,
          path: "/cart",
          builder: (context, state) => CartPage()),
    ],
    redirect: (context, state) async {
      bool isAuthenticated = false;
      if (!isAuthenticated && state.subloc == '/') {
        return state.namedLocation(AppRoutes.loginRoute);
      } else if (isAuthenticated && state.subloc == '/') {
        return state.namedLocation(AppRoutes.homeRoute);
      } else {
        return null;
      }
    },
  );
}
