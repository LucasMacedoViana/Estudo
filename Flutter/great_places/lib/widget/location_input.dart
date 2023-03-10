import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImgeUrl;

  Future<void> _getCurrentUserLocation() async{
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

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
              onPressed: () {},
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
