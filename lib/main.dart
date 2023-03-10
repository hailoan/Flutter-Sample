import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
      body: DemoSwipe(),
    )));
  }
}

class DemoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('onTap')));
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(10.0)),
            child: const Text('InkWell'),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('onTap')));
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('InkWell'),
          ),
        )
      ],
    );
  }
}

class DemoSwipe extends StatefulWidget {
  const DemoSwipe({super.key});

  @override
  State<DemoSwipe> createState() => _DemoSwipeState();
}

class _DemoSwipeState extends State<DemoSwipe> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return Dismissible(
              key: Key(item),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('removed')));
              },
              child: ListTile(
                title: Text(items[index]),
              ));
        },
      ),
    );
  }
}
