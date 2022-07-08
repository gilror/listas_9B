import 'package:flutter/material.dart';
import 'package:places/models/places.dart';
import 'package:places/widgets/title_place.dart';

class TitlePlace extends StatelessWidget {
  const TitlePlace({Key? key, required this.place}) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(place.title)),
                Container(child: Text(place.subtitle)),
              ],
            ),
          ),
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('2545'),
          )
        ],
      ),
    );
  }
}
