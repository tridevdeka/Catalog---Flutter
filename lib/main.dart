import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/app_router.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/ui/cart_page.dart';
import 'package:flutter_catalog/ui/home_detail.dart';
import 'package:flutter_catalog/ui/home_page.dart';
import 'package:flutter_catalog/ui/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: AppStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  var name = "Tridev";
  var appRouter=AppRouter().router;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme(context),
      darkTheme: AppThemes.darkTheme(context),

      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,

      //Navigator 1.0
      /*initialRoute: AppRoutes.homeRoute,
      routes: {
        AppRoutes.loginRoute: (context) => LoginPage(),
        AppRoutes.homeRoute: (context) => HomePage(),
        AppRoutes.homeDetailRoute: (context) => HomeDetailPage.noArguments(),
        AppRoutes.cartRoute: (context) => CartPage(),
      },*/


    );
  }

  /*final goRouter = GoRouter(
      debugLogDiagnostics: true,
      // initialLocation: '/',
      redirect: (context, state) async {
        bool isAuthenticated = false;
        return (!isAuthenticated && state.path == '/') ? '/login' : null;
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context,state)=>MaterialPage(child: HomePage()),
        ),
        GoRoute(path: '/home', builder: (context, state) => HomePage()),
        GoRoute(
            path: '/home_detail',
            builder: (context, state) => HomeDetailPage.noArguments()),
        GoRoute(path: '/cart', builder: (context, state) => CartPage()),
      ]);*/
}
