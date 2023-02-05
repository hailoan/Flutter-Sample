import 'package:flutter/widgets.dart';

class DemoStackLayout extends StatelessWidget {
  const DemoStackLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(), Stack()],
    );
  }
}
