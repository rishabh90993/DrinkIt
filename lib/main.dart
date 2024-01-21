
import 'package:drink_it/Models/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Route/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await UserDetails.getUserDetails();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final  GoRouter _router = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser != null ? "/home" : "/",
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