import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qeema_task/presentation/screens/home_screen.dart';

import '../../domain/entities/product_entity.dart';
import '../../presentation/screens/product_details_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

abstract class Routes {
  static const home = "/home";
  static const productDetails = "/productDetails";
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
    GoRoute(
        path: Routes.productDetails,
        builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        final product = data['product'] as ProductEntity;
          return ProductDetailScreen(product: product);
        }),
  ],
);


