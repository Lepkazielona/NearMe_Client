import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../screens/user_view.dart';

class MapView extends StatefulWidget {
  const MapView({super.key, bool brightness = false});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _gMController =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Future<void> _onMapCreated(controller) async {
    _gMController.complete(controller);
    var _cum = await _gMController.future;
    bool isDarkMode = SchedulerBinding.instance.window.platformBrightness ==
        Brightness.dark; //true if dark
    _upLocation();

    if (isDarkMode) {
      String cumString = await DefaultAssetBundle.of(context)
          .loadString('assets/map_style_dark.json');
      _cum.setMapStyle(cumString);
    } else {
      String cumString = await DefaultAssetBundle.of(context)
          .loadString('assets/map_style_light.json');
      _cum.setMapStyle(cumString);
    }
  }

  int up = 0;
  Future<void> _upLocation() async {
    var location = Location();
    try {
      var currentLocation = await location.getLocation();
      print("locationLatitude: ${currentLocation.latitude}");
      print("locationLongitude: ${currentLocation.longitude}");
      final GoogleMapController GMController = await _gMController.future;
      GMController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 17,
          target: LatLng(double.parse(currentLocation.latitude.toString()),
              double.parse(currentLocation.longitude.toString())))));
      DatabaseReference ref = FirebaseDatabase.instance.ref("location");
      up++;

      await ref.set({
        "test": {
          "latitude": currentLocation.latitude,
          "longitude": currentLocation.longitude,
          "name": "penis",
          "up": up
        }
      });
    } on Exception {
      //currentLocation = LocationData();
      print("chuj, zjebało się");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              compassEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            child: FloatingActionButton(
              heroTag: "usrViewBtn",
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserView())),
              child: Icon(Icons.umbrella),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "locationBtn",
        child: const Icon(Icons.navigation_outlined),
        onPressed: () => {_upLocation()},
      ),
    );
  }
}
