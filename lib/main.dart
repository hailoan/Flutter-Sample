import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: DemoColmnLayout(),
      )),
    );
  }
}

typedef ChangeMainAxis = Function(MainAxisAlignment mainAxis);

typedef ChangeCrossAxis = Function(CrossAxisAlignment crossAxis);

class DemoColmnLayout extends StatefulWidget {
  const DemoColmnLayout({super.key});

  @override
  State<DemoColmnLayout> createState() => _DemoColmnLayoutState();
}

class _DemoColmnLayoutState extends State<DemoColmnLayout> {
  MainAxisAlignment mainAxisRow = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisRow = CrossAxisAlignment.center;

  MainAxisAlignment mainAxisColumn = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisColumn = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTest(),
        RowTest(
            mainAxis: mainAxisRow,
            crossAxis: crossAxisRow,
            changeMainAxis: (value) {
              setState(() {
                mainAxisColumn = value;
              });
            },
            changeCrossAxis: (value) {
              setState(() {
                crossAxisColumn = value;
              });
            }),
        Expanded(
          child: ColumnTest(
              mainAxis: mainAxisColumn,
              crossAxis: crossAxisColumn,
              changeMainAxis: (value) {
                setState(() {
                  mainAxisRow = value;
                });
              },
              changeCrossAxis: (value) {
                setState(() {
                  crossAxisRow = value;
                });
              }),
        )
      ],
    );
  }

  Row _buildTest() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconTitle(iconData: Icons.call, title: 'call phone'),
        IconTitle(iconData: Icons.home, title: 'home'),
        IconTitle(iconData: Icons.share, title: 'Share')
      ],
    );
  }
}

class IconTitle extends StatelessWidget {
  IconTitle({
    required this.iconData,
    required this.title,
    super.key,
  });
  IconData iconData;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(iconData), Text(title)],
    );
  }
}

class ColumnTest extends StatelessWidget {
  ColumnTest(
      {required this.mainAxis,
      required this.crossAxis,
      required this.changeMainAxis,
      required this.changeCrossAxis,
      super.key});

  MainAxisAlignment mainAxis = MainAxisAlignment.start;

  CrossAxisAlignment crossAxis = CrossAxisAlignment.center;

  ChangeCrossAxis changeCrossAxis;
  ChangeMainAxis changeMainAxis;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxis,
      crossAxisAlignment: crossAxis,
      children: [
        ElevatedButton(
            onPressed: () {
              changeMainAxis.call(MainAxisAlignment.spaceEvenly);
            },
            child: const Text('evenly')),
        ElevatedButton(
            onPressed: () {
              changeMainAxis.call(MainAxisAlignment.spaceBetween);
            },
            child: const Text('between')),
        ElevatedButton(
            onPressed: () {
              changeMainAxis.call(MainAxisAlignment.start);
            },
            child: const Text('start')),
        ElevatedButton(
            onPressed: () {
              changeMainAxis.call(MainAxisAlignment.end);
            },
            child: const Text('end')),
        ElevatedButton(
            onPressed: () {
              changeMainAxis.call(MainAxisAlignment.center);
            },
            child: const Text('center'))
      ],
    );
  }
}

class RowTest extends StatelessWidget {
  RowTest(
      {required this.mainAxis,
      required this.crossAxis,
      required this.changeMainAxis,
      required this.changeCrossAxis,
      super.key});

  MainAxisAlignment mainAxis = MainAxisAlignment.start;

  CrossAxisAlignment crossAxis = CrossAxisAlignment.center;

  ChangeCrossAxis changeCrossAxis;
  ChangeMainAxis changeMainAxis;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildRowMainAxis(), _buildRowCrossAxis()],
    );
  }

  Row _buildRowMainAxis() {
    return Row(
      mainAxisAlignment: mainAxis,
      crossAxisAlignment: crossAxis,
      children: [
        ElevatedButton(
            onPressed: () => changeMainAxis(MainAxisAlignment.spaceEvenly),
            child: const Text('evenly')),
        ElevatedButton(
            onPressed: () => changeMainAxis(MainAxisAlignment.spaceBetween),
            child: const Text('between')),
        ElevatedButton(
            onPressed: () => changeMainAxis(MainAxisAlignment.start),
            child: const Text('start')),
        ElevatedButton(
            onPressed: () => changeMainAxis(MainAxisAlignment.end),
            child: const Text('end')),
        ElevatedButton(
            onPressed: () => changeMainAxis(MainAxisAlignment.center),
            child: const Text('center'))
      ],
    );
  }

  Row _buildRowCrossAxis() {
    return Row(
      mainAxisAlignment: mainAxis,
      crossAxisAlignment: crossAxis,
      children: [
        ElevatedButton(
            onPressed: () => changeCrossAxis(CrossAxisAlignment.start),
            child: const Text('Start')),
        ElevatedButton(
            onPressed: () => changeCrossAxis(CrossAxisAlignment.end),
            child: const Text('End')),
        ElevatedButton(
            onPressed: () => changeCrossAxis(CrossAxisAlignment.stretch),
            child: const Text('stretch'))
      ],
    );
  }
}

class DemoContainerLayout extends StatelessWidget {
  const DemoContainerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello'),
    );
  }
}

class DemoStackLayout extends StatelessWidget {
  const DemoStackLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(), Stack()],
    );
  }
}
