import 'package:flutter/material.dart';
import 'package:places/widgets/grid_cards.dart';

Widget screenMedium() {
  return Row(
    children: [
      //Expanded toma todo el espacio disponible
      Expanded(flex: 2, child: Text('Drawer')),
      Expanded(
        flex: 5,
        child: GridCards(),
      )
    ],
  );
}
