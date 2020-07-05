import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readtextfile/constents/Strings.dart';

import 'map_screen/mapScreen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  BitmapDescriptor pinLocationIcon;
  BitmapDescriptor pinLocationIcon1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCustomMapPin(); //TO load custom marker image
    _loadQuestions();
  }

  void setCustomMapPin() async {
    //using async and await method load image to variable
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 1,
          size: Size(1, 1),
        ),
        'assets/destination_map_marker.png');
    pinLocationIcon1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          devicePixelRatio: 1,
          size: Size(1, 1),
        ),
        'assets/red_mark.png');
  }

  List<Marker> _markers = <Marker>[];

  List<String> mocks = []; //load entire data this variable

  Future<List<String>> _loadQuestions() async {
    await rootBundle.loadString("assets/mock.txt").then((q) {
      for (String i in LineSplitter().convert(q)) {
        mocks.add(i);
      }
    });
    List<String> lstVar = [];
    for (var first in mocks) {
      //iterating throu the mocks data and add each item to marker list
      if (first.length != null) {
        for (var varA in first.split(",")) {
          lstVar.add(varA);
        }
        if (lstVar.length != 0 &&
            lstVar != null &&
            _markers.length != totalData) {
          _addMarkerList(lstParam: lstVar);
        }
        lstVar.clear();
      }
    }
    return mocks;
  }

  int totalMales = 0;
  int totalFeMales = 0;

  _addMarkerList({List<String> lstParam}) {
    if (lstParam != null && lstParam.length != 0) {
      if (lstParam[1] !=
              "first_name" && // not need to add the first row so check here
          lstParam.length != 0 &&
          lstParam != null &&
          lstParam != []) {
        if (lstParam[3] == femaleStr) {
          totalFeMales += 1;
        } else {
          totalMales += 1;
        }

        setState(() {
          //after checking the value add to marks list
          _markers.add(Marker(
              markerId: MarkerId(lstParam[0]),
              icon:
                  lstParam[3] == femaleStr ? pinLocationIcon : pinLocationIcon1,
              position: LatLng(double.parse(lstParam[4].toString()),
                  double.parse(lstParam[5].toString())),
              infoWindow:
                  InfoWindow(title: '${lstParam[1] + " " + lstParam[2]}')));
        });
      } else {
        print("ERROR");
      }
    }

    if (_markers.length == totalData) {
      //if the _marks array reach the total data then it takes to map screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MapScreen(
                  markers: _markers,
                  totalFemale: totalFeMales,
                  totalMale: totalMales,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/destination_map_marker.png"),
          ],
        )
      ],
    );
  }
}
