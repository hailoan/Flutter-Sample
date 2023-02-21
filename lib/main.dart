import 'package:fluter_sample_test/DownloadDemo.dart';
import 'package:flutter/material.dart';

import 'DrawerDemo.dart';

void main() {
  runApp(const MainApp());
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
      home: Container(
        color: Colors.white,
        child: Center(
          child: DownloadButton(
            status: DownloadStatus.downloading,
            onCancel: () => _openCancel(),
            onOpen: () => _openApp(),
            onStarting: () => _openCancel(),
          ),
        ),
      ),
    );
  }

  void _openDownload() {
    print('open download');
  }

  void _openCancel() {
    print('_openCancel');
  }

  void _openApp() {
    print('_openApp');
  }
}
