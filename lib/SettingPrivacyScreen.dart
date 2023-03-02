import 'package:fluter_sample_test/main.dart';
import 'package:flutter/material.dart';

class SettingPrivacyScreen extends StatelessWidget {
  const SettingPrivacyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('setting Privacy'),
        onPressed: () {
          Navigator.pushNamed(context, routeSettingAbout);
        },
      ),
    );
  }
}
