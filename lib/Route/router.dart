
import 'package:drink_it/UI/home_screen.dart';
import 'package:drink_it/UI/login.dart';
import 'package:drink_it/UI/product_details_screen.dart';
import 'package:drink_it/UI/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRoutes = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const LoginPage();
    },
  ),
  GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
    routes: [
      GoRoute(
        path: 'productDetails',
        builder: (BuildContext context, GoRouterState state) {
          return const ProductDetailsScreen();
        },
      ),
      GoRoute(
        path: 'profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileScreen();
        },
      ),
    ]
  ),
];
