import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sniperdriver/widgets/color.dart';

class MapScreen extends StatelessWidget {
  final double lat;
  final double lng;

  MapScreen({required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPurple,
        title: Text('الرئيسية',style: TextStyle(fontSize: 26, color: white),),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: 'Your Location',
            ),
          ),
        },
      ),
    );
  }
}
