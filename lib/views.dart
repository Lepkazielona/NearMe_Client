import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}




class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static const CameraPosition _camPos = CameraPosition(
    target: LatLng(50.29592124712068, 18.66804001837419),
    zoom: 14
    );

Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    String cum = await DefaultAssetBundle.of(context)
      .loadString('assets/style.json');
    controller.setMapStyle(cum);
}
void _upLocation() async {
      var location = Location();
    try {
      var currentLocation = await location.getLocation();

      print("locationLatitude: ${currentLocation.latitude}");
      print("locationLongitude: ${currentLocation.longitude}");
      final GoogleMapController GMController = await _controller.future;
      GMController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(zoom: 15, target: LatLng(double.parse(currentLocation.latitude.toString()), double.parse(currentLocation.longitude.toString())))));
    } on Exception {
      //currentLocation = LocationData();
      print("chuj, zjebało się");
    }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation_outlined),
        onPressed: _upLocation,
      ),
      body: GoogleMap(
        initialCameraPosition: _camPos,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        tiltGesturesEnabled: false,
        compassEnabled: false,
        myLocationButtonEnabled: false,
      )
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}