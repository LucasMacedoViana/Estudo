import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/utils/location_util.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPosition;
  const LocationInput({Key? key,required this.onSelectPosition}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImgeUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
        latitude: locData.latitude!, longitude: locData.longitude!);

    setState(() {
      _previewImgeUrl = staticMapImageUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final LatLng selectedPosition = await Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx) => MapsScreen(),
        ));
    if (selectedPosition == null) return;
    widget.onSelectPosition(selectedPosition);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImgeUrl == null
              ? Text('Nenhuma localização foi informada!')
              : Image.network(
                  _previewImgeUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: _getCurrentUserLocation,
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text('Localização Atual'),
                  ],
                )),
            TextButton(
              onPressed: _selectOnMap,
              child: Row(
                children: [
                  Icon(Icons.map),
                  Text('Selecione no Mapa'),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}