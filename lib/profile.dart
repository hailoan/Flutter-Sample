import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProfileArgument;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(args.title),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200.0,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item #$index')),
            childCount: 1000,
          ))
        ],
      ),
    );
  }
}

class ProfileArgument {
  final String title;
  final String message;

  ProfileArgument(this.title, this.message);
}
