import 'package:flutter/material.dart';

class PhotoFilterDemo extends StatefulWidget {
  const PhotoFilterDemo({super.key});

  @override
  State<PhotoFilterDemo> createState() => _PhotoFilterDemoState();
}

class _PhotoFilterDemoState extends State<PhotoFilterDemo> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(child: _buildPhotoWithFilter()),
      Positioned(
        bottom: 0,
        child: _buildFilterSelector(),
      )
    ]);
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, value, child) => Image.network(
          'https://docs.flutter.dev/cookbook/img-files/effects/instagram-buttons/millenial-dude.jpg',
          color: value.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
          fit: BoxFit.cover),
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      filters: _filters,
      onFilterChange: _onFilterChanged,
    );
  }
}

class FilterSelector extends StatefulWidget {
  FilterSelector(
      {required this.filters, required this.onFilterChange, super.key});
  List<Color> filters;
  final void Function(Color selected) onFilterChange;

  @override
  State<FilterSelector> createState() => _FilterSelectorState();
}

class _FilterSelectorState extends State<FilterSelector> {
  @override
  Widget build(BuildContext context) {
    return Scrollable(viewportBuilder: LayoutBuilder(builder: (p0, p1) => 
    ,))
  }

  Widget buildRing(double itemSize) {
    return IgnorePointer(
      ignoring: true,
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: const DecoratedBox(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                    BorderSide(color: Colors.white, width: 2.0)))),
      ),
    );
  }
}
