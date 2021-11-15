import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(idea());

class idea extends StatefulWidget {
  @override
  State<idea> createState() => _SearchPageState();
}

class _SearchPageState extends State<idea> {

  late GoogleMapController _controller;

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(24.903623, 67.198367));

  final List<Marker> markers = [];

  addMarker(cordinate){

    int id = Random().nextInt(100);

    setState(() {
      markers.add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapToolbarEnabled: true,
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller){
          setState(() {
            _controller = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate){
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),
    );
  }


}

