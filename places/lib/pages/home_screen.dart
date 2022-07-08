import 'package:flutter/material.dart';
import 'package:places/data/places.dart';
import 'package:places/pages/screen_large.dart';
import 'package:places/pages/screen_medium.dart';
import 'package:places/pages/screen_small.dart';
import 'package:places/responsive_utils.dart';
import 'package:places/widgets/grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(MediaQuery.of(context).size.width);
    Widget widget;

    switch (screenSize) {
      case ScreenSize.small:
        //Mostrar el layout de mobile
        widget = screenSmall();
        break;
      case ScreenSize.medium:
        widget = screenMedium();
        break;
      case ScreenSize.large:
        widget = screenLarge();
        break;
    }

    return widget;
  }
}
