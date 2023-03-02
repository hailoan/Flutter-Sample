import 'package:fluter_sample_test/SettingNotificationScreen.dart';
import 'package:fluter_sample_test/SettingPrivacyScreen.dart';
import 'package:fluter_sample_test/SettingScreen.dart';
import 'package:flutter/material.dart';

import 'DrawerDemo.dart';

const routeHome = '/';
const routeSetting = '/settings';
const routeSettingNotification = '/settings/notification';
const routeSettingAbout = '/settings/about';
const routeSettingAboutPrivacy = '/settings/about/privacy';

void main() {
  runApp(const MainApp());
}

class SetupFlow extends StatefulWidget {
  const SetupFlow({super.key, required this.setupPageroute});

  final String setupPageroute;

  @override
  State<StatefulWidget> createState() {
    return SetupFlowState();
  }
}

class SetupFlowState extends State<SetupFlow> {
  @override
  Widget build(BuildContext context) {
    return MainApp();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrawDemo',
      theme: ThemeData(
          fontFamily: 'sf',
          textTheme: const TextTheme(
              labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              labelSmall: TextStyle(fontSize: 14))),
      initialRoute: routeHome,
      onGenerateRoute: (settings) {
        late Widget page;
        switch (settings.name) {
          case routeHome:
            page = DrawerDemo(
              onClickItem: (p0) {
                // Navigator.pushNamed(context, routeSetting);
              },
            );
            break;
          case routeSetting:
            page = const SettingScreen();
            break;
          case routeSettingAbout:
            page = const SettingPrivacyScreen();
            break;
          case routeSettingAboutPrivacy:
            page = const SettingPrivacyScreen();
            break;
          case routeSettingNotification:
            page = const SettingNotificationScreen();
            break;
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
    );
  }
}
