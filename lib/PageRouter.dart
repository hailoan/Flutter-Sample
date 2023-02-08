import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('next'),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      // final tween =
      //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // final offsetAnimation = animation.drive(tween);
      // return SlideTransition(
      //   position: offsetAnimation,
      //   child: child,
      // );
      final tween = Tween(begin: begin, end: end);
      final curveAnimation = CurvedAnimation(parent: animation, curve: curve);
      return SlideTransition(
        position: tween.animate(curveAnimation),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          color: Colors.black26,
          child: const Center(
            child: Text('wellcome page2'),
          )),
    );
  }
}
