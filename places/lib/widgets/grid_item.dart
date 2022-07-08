import 'package:flutter/material.dart';
import '../models/places.dart';
import 'package:places/pages/details_place.dart';

class GridItem extends StatelessWidget {
  const GridItem({Key? key, required this.place}) : super(key: key);
  final Place place;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPlace(
                      place: place,
                    )))
      },
      child: Card(
        elevation: 20.0,
        //shadowColor: Colors.black, Camvbia color de la sombra
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: GridTile(
          child: Ink.image(image: AssetImage(place.image), fit: BoxFit.cover),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(place.title),
            subtitle: Text(place.subtitle),
            //leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.favorite_border),
          ),
        ),
      ),
    );
  }
}
