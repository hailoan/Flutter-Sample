import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  DrawerDemo({super.key});

  BuildContext? context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        bottom: const TabBar(tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.favorite),
          )
        ]),
      ),
      body: const TabBarView(children: [Text('hello'), Text('data')]),
    );
  }
}
