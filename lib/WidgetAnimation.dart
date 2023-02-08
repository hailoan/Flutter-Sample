import 'package:flutter/material.dart';

class WidgetAnimation extends StatefulWidget {
  const WidgetAnimation({super.key});
  @override
  State<WidgetAnimation> createState() => _WidgetAnimationState();
}

class _WidgetAnimationState extends State<WidgetAnimation> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(seconds: 1),
        child: Center(
          child: Container(
            width: 100,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
