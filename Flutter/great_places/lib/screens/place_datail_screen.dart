import 'package:flutter/material.dart';
import 'package:great_places/models/place.dart';
import 'package:great_places/screens/map_screen.dart';

class PlaceDatailScreen extends StatelessWidget {
  const PlaceDatailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context)!.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 10),
        Text(
          place.location.address!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        SizedBox(height: 10),
        TextButton.icon(
          onPressed: () { Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true, builder: (ctx) => MapsScreen(isReadOnly: true, initialLocation: place.location,),));},
          icon: Icon(Icons.map),
          label: Text('Ver no Mapa'),
          style: TextButton.styleFrom(
            primary: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],) ,
    );
  }
}
