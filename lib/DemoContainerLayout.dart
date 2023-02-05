import 'package:flutter/material.dart';

class DemoContainerLayout extends StatelessWidget {
  const DemoContainerLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildGridView();
  }

  Container _buildContainer() {
    return Container(
      margin: const EdgeInsets.all(100),
      padding: const EdgeInsets.only(left: 100),
      decoration: BoxDecoration(
          border: Border.all(width: 4.0, color: Colors.black),
          color: Colors.green,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: const [
          Center(
            child: Text(
                'hello hello hello hello hello hello hello hello hello hello'),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'hello hello hello hello hello hello hello hello hello hello',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  GridView _buildGridView() {
    var images = [
      'images/lake.jpg',
      'images/lake.jpg',
      'images/lake.jpg',
      'images/lake.jpg',
      'images/lake.jpg',
      'images/lake.jpg',
      'images/lake.jpg',
      'images/lake.jpg',
      'images/lake.jpg'
    ];
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 5,
      children: images
          .map((e) => Image.asset(
                e,
                fit: BoxFit.fill,
              ))
          .toList(),
    );
  }
}
