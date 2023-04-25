import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const CameraPosition _kLake = CameraPosition(
    // bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    // tilt: 59.440717697143555,
    zoom: 19.151926040649414);
const CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

class Gmaps extends StatefulWidget {
  const Gmaps({super.key});

  @override
  State<Gmaps> createState() => _GmapsState();
}

class _GmapsState extends State<Gmaps> {
  final List<Marker> _marker = [];
  final List<Marker> _list = [
    const Marker(
        markerId: MarkerId('1'),
        infoWindow: InfoWindow(title: 'Rauf Location'),
        position: LatLng(37.42796133580664, -122.085749655962)),
    const Marker(
        markerId: MarkerId('1'),
        infoWindow: InfoWindow(title: 'abdul Location'),
        position: LatLng(36.42796133580664, -120.085749655962))
  ];
  @override
  void initState() {
    _marker.addAll(_list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: Set.of(_marker),
      ),
    );
  }
}
