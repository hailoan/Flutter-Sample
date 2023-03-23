import 'package:flutter/material.dart';

class AvatarOnline extends StatelessWidget {
  AvatarOnline({
    required this.name,
    required this.avatar,
    required this.size,
    super.key,
  });

  String? avatar;
  String? name;
  var size = 72.0;

  @override
  Widget build(BuildContext context) {
    Widget? mainWidget;
    var sizeAvatar = size;
    if (avatar != null) {
      mainWidget = CircleAvatar(
        backgroundImage: NetworkImage(avatar ?? ""),
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
    var sizeOnline = sizeAvatar / 4.5;
    return Stack(
      alignment: const Alignment(1.0, 1.0),
      children: [
        mainWidget,
        Container(
          width: sizeOnline,
          height: sizeOnline,
          margin: const EdgeInsets.only(right: 2, bottom: 2),
          decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(width: sizeOnline / 4.0, color: Colors.white)),
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
