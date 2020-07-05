import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readtextfile/src/widgets/showPopulationWidget.dart';

class MapScreen extends StatefulWidget {
  List<Marker> markers;
  int totalMale, totalFemale;

  MapScreen({this.markers, this.totalFemale, this.totalMale});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> _markers = <Marker>[];
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _body(markers: _markers),
          Positioned(
            child: PopulationWidget(context,
                femaleParam: widget.totalFemale, maleParam: widget.totalMale),
            bottom: 30,
            left: MediaQuery.of(context).size.width / 4,
          ),
        ],
      ),
    );
  }

  Widget _body({List<Marker> markers}) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(27.948308, 109.599191),
        zoom: 1.0,
      ),
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      markers: Set<Marker>.of(widget.markers),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
