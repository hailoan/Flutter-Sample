import 'package:flutter/material.dart';

import 'DrawerDemo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrawDemo',
      theme: ThemeData(
          fontFamily: 'sf',
          textTheme: const TextTheme(
              labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              labelSmall: TextStyle(fontSize: 14))),
      home: DrawerDemo(),
    );
  }
}
