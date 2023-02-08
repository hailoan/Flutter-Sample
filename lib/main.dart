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
      home: DrawerDemo(),
    );
  }
}
