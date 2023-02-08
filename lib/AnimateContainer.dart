import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimateContainerDemo extends StatefulWidget {
  @override
  State<AnimateContainerDemo> createState() => _AnimateContainerDemoState();
}

class _AnimateContainerDemoState extends State<AnimateContainerDemo> {
  var _width = 40.0;
  var _height = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animation Container')),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 1200),
        width: _width,
        height: _height,
        decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        curve: Curves.bounceOut,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
