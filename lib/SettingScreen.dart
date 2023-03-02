import 'package:fluter_sample_test/main.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('setting'),
        onPressed: () {
          Navigator.pushNamed(context, routeSettingAbout);
        },
      ),
    );
  }
}
