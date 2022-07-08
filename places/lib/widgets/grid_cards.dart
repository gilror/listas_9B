import 'package:flutter/material.dart';

import '../data/places.dart';
import 'grid_item.dart';

class GridCards extends StatelessWidget {
  const GridCards({Key? key, this.isHorizontal = false}) : super(key: key);

  final isHorizontal;

  @override
  Widget build(BuildContext context) {
    int columCount;
    Axis axisDirection;

    if (isHorizontal) {
      columCount = 1;
      axisDirection = Axis.horizontal;
    } else {
      columCount = 2;
      axisDirection = Axis.vertical;
    }

    return GridView.count(
      crossAxisCount: columCount,
      scrollDirection: axisDirection,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1 / 2,
      padding: EdgeInsets.all(10),
      children: showItems(),
    );
  }
}

List<Widget> showItems() {
  //Recorrer la lista de places.dart
  return Places().getPlaces().map((place) => GridItem(place: place)).toList();
}
