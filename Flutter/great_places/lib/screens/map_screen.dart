import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapsScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  const MapsScreen({
    this.initialLocation = const PlaceLocation(
        latitude: 37.422011701179, longitude: -122.08366060294),
    this.isReadOnly = false,
  });

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selecione...'),
          actions: <Widget>[
            if (!widget.isReadOnly)
              IconButton(
                  onPressed: _pickedPosition == null
                      ? null
                      : () {
                          Navigator.pop(context, _pickedPosition);
                        },
                  icon: Icon(Icons.check))
          ],
        ),
        body: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.initialLocation.latitude,
                  widget.initialLocation.longitude,
                ),
                zoom: 13),
            onTap: widget.isReadOnly ? null : _selectPosition,
            markers: (_pickedPosition == null && !widget.isReadOnly)
                ? {}
                : {
                    Marker(
                      markerId: MarkerId('m1'),
                      position:
                          _pickedPosition ?? widget.initialLocation.toLatLng(),
                    )
                  }));
  }
}
