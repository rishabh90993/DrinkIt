
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Route/router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final  GoRouter _router = GoRouter(
    routes: appRoutes,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Drink It',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}