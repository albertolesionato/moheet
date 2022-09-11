import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'secrets.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late final String mapStyle;

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString('assets/map_style.json')
        .then((value) => mapStyle = value);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      rotateGesturesEnabled: false,
      scrollGesturesEnabled: false,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
      tiltGesturesEnabled: false,
      // mapType: MapType.terrain,
      initialCameraPosition: const CameraPosition(target: location, zoom: 18),
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(mapStyle);
      },
    );
  }
}
