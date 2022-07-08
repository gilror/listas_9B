import 'package:places/models/places.dart';
import 'package:flutter/material.dart';
import 'package:places/widgets/title_place.dart';

class DetailsPlace extends StatelessWidget {
  const DetailsPlace({Key? key, required this.place}) : super(key: key);
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        centerTitle: true,
      ),
      body: ListView( 
        children: [
          Image.asset(
            place.image,
            height: 300,
            fit: BoxFit.cover,
          ),
          TitlePlace(place: place),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
          ),
        ],
      ),
    );
  }
}
