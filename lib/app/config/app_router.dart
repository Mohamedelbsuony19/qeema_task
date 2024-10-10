import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qeema_task/presentation/screens/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

abstract class Routes {
  static const home = "/home";
}

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: navigatorKey,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
