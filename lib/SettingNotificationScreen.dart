import 'package:fluter_sample_test/main.dart';
import 'package:flutter/material.dart';

class SettingNotificationScreen extends StatelessWidget {
  const SettingNotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('SettingNotificationScreen'),
        onPressed: () {
          Navigator.pushNamed(context, routeSettingAbout);
        },
      ),
    );
  }
}
