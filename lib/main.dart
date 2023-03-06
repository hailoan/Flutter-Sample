import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LocationList(),
      ),
    );
  }
}

class LocationList extends StatelessWidget {
  const LocationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: locations.map((e) => ItemLocation(location: e)).toList(),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemLocation extends StatelessWidget {
  ItemLocation({required this.location, super.key});

  Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(children: [
              _backgroundLocation(),
              _buildGradient(),
              _buildContent()
            ]),
          ),
        ));
  }

  Widget _backgroundLocation() {
    return Image.network(
      location.imageUrl,
      fit: BoxFit.cover,
      width: 800,
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95]),
      ),
    ));
  }

  Widget _buildContent() {
    return Positioned(
        left: 10.0,
        bottom: 6.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(location.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.white)),
            Text(location.place,
                style: const TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.white))
          ],
        ));
  }
}

class Location {
  Location({required this.name, required this.place, required this.imageUrl});
  final String name;
  final String place;
  final String imageUrl;
}

const urlPrefix =
    'https://docs.flutter.dev/cookbook/img-files/effects/parallax';

List<Location> locations = [
  Location(
    name: 'Mount Rushmore',
    place: 'U.S.A',
    imageUrl: '$urlPrefix/01-mount-rushmore.jpg',
  ),
  Location(
    name: 'Gardens By The Bay',
    place: 'Singapore',
    imageUrl: '$urlPrefix/02-singapore.jpg',
  ),
  Location(
    name: 'Machu Picchu',
    place: 'Peru',
    imageUrl: '$urlPrefix/03-machu-picchu.jpg',
  ),
  Location(
    name: 'Vitznau',
    place: 'Switzerland',
    imageUrl: '$urlPrefix/04-vitznau.jpg',
  ),
  Location(
    name: 'Bali',
    place: 'Indonesia',
    imageUrl: '$urlPrefix/05-bali.jpg',
  ),
  Location(
    name: 'Mexico City',
    place: 'Mexico',
    imageUrl: '$urlPrefix/06-mexico-city.jpg',
  ),
  Location(
    name: 'Cairo',
    place: 'Egypt',
    imageUrl: '$urlPrefix/07-cairo.jpg',
  ),
];
