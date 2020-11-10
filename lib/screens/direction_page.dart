import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class DirectionPage extends StatefulWidget {
  @override
  _DirectionPageState createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage> {
  BitmapDescriptor _markerIcon;
  Set<Marker> _markers = HashSet<Marker>();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  LatLng _center = const LatLng(33.738045, 73.084488);

  final Set<Polyline> _polyline = {};
  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/icons/marker.png');
  }

  double myLat;
  double myLng;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    myLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(myLat, myLng),
              zoom: 17.0,
            ),
            markers: _markers,
            myLocationEnabled: true,
            polylines: _polyline,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {

              setState(
                () {
                  _markers.add(
                    Marker(
                      markerId: MarkerId('0'),
                      position: LatLng(-1.834985, 109.978629),
                      infoWindow: InfoWindow(
                        title: "Gentleman Barbershop",
                        snippet: 'lol ah',
                      ),
                      icon: _markerIcon,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void myLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      myLat = position.latitude;
      myLng = position.longitude;
    });
    _polyline.add(Polyline(
      polylineId: PolylineId(_center.toString()),
      visible: true,
      geodesic: true,
      //latlng is List<LatLng>
      points: [
        LatLng(myLat, myLng),
        LatLng(-1.834985, 109.978629),
      ],
      color: Colors.blue,
    ));
  }


}
