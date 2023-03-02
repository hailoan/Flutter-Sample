import 'package:fluter_sample_test/main.dart';
import 'package:flutter/material.dart';

class SettingAboutScreen extends StatelessWidget {
  const SettingAboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('setting About'),
        onPressed: () {
          Navigator.pushNamed(context, routeSettingAbout);
        },
      ),
    );
  }
}
