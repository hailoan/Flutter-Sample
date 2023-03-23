import 'package:fluter_sample_test/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'MessageDetailScreen.dart';

const String routeHome = '/';
const String routeProfile = '/profile';

final router = GoRouter(routes: [
  GoRoute(
    path: routeHome,
    builder: (context, state) => MessageDetailScreen(),
  ),
  GoRoute(
    path: routeProfile,
    builder: (context, state) => ProfileScreen(),
  )
]);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: routeHome,
      routes: {
        routeHome: (context) => MessageDetailScreen(),
        routeProfile: (context) => ProfileScreen()
      },
    );
  }
}
