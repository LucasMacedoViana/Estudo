import 'dart:io';
import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double latitute;
  final double longitude;
  final String address;

  PlaceLocation(
    this.address, {
    required this.latitute,
    required this.longitude,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
