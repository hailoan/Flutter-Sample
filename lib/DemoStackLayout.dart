import 'package:flutter/material.dart';

class DemoStackLayout extends StatelessWidget {
  const DemoStackLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return AvatarOnline(name: 'Hai Loan', avatar: 'images/lake.jpg');
  }
}

class AvatarOnline extends StatelessWidget {
  AvatarOnline({
    required this.name,
    required this.avatar,
    super.key,
  });

  String? avatar;
  String? name;

  @override
  Widget build(BuildContext context) {
    Widget? mainWidget;
    var sizeAvatar = 72.0;
    if (avatar != null) {
      mainWidget = CircleAvatar(
        backgroundImage: AssetImage(avatar!),
        radius: sizeAvatar / 2,
      );
    } else {
      mainWidget = Container(
        width: sizeAvatar,
        height: sizeAvatar,
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Center(
            child: Text(
          name == null ? 'H' : name!.getShortName(),
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
      );
    }
    return Stack(
      alignment: const Alignment(1.0, 1.0),
      children: [
        mainWidget,
        Container(
          width: 16,
          height: 16,
          margin: const EdgeInsets.only(right: 2, bottom: 2),
          decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(width: 2.0, color: Colors.white)),
        )
      ],
    );
  }
}

extension ShortName on String {
  String getShortName() {
    var arrNames = split(' ');
    return arrNames.first[0];
  }
}
