import 'package:flutter/material.dart';

class DemoConstraintBox extends StatelessWidget {
  const DemoConstraintBox({super.key});
  @override
  Widget build(BuildContext context) {
    return _buildFlexibleLayout();
  }

  ConstrainedBox _buildConstrainBox() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
          maxHeight: 150, maxWidth: 150, minHeight: 100, minWidth: 100),
      child: Container(
        width: 120,
        height: 120,
        color: Colors.red,
      ),
    );
  }

  Widget _buildFixBox() {
    return const FittedBox(
        child: Text(
      'The screen forces the FittedBox to be exactly the same size as the screen. The Text has some natural width (also called its intrinsic width) that depends on the amount of text, its font size, and so on.\nThe FittedBox lets the Text be any size it wants, but after the Text tells its size to the FittedBox, the FittedBox scales the Text until it fills all of the available width.\n\'),',
      style: TextStyle(fontSize: 20),
    ));
  }

  Widget _buildExpandLayout() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.red,
            child: const Text(
              'This is a very long text that won\'t fit the line.',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: const Text(
              'Goodbye!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlexibleLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            color: Colors.red,
            child: const Text(
              'This is a very long text that won\'t fit the line.',
              style: TextStyle(fontSize: 20),
              maxLines: 5,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Container(
            color: Colors.green,
            child: const Text(
              'This is a very long text that won\'t fit the line.\nThis is a very long text that won\'t fit the line.',
              style: TextStyle(fontSize: 20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
