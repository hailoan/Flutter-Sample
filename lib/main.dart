import 'package:fluter_sample_test/DemoConstraintBox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: DemoConstraintBox(),
      )),
    );
  }
}
