import 'package:flutter/material.dart';

import 'AnimateContainer.dart';
import 'PageRouter.dart';
import 'PhysicsCardDrag.dart';
import 'WidgetAnimation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WidgetAnimation(),
    );
  }
}
