import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget{
  @override
  _LocationHomeState createState() => _LocationHomeState();
}

class _LocationHomeState extends State<LocationScreen> {
  var locationMessage = '';
  String latitude;
  String longitude;

  /* 위도 경도로 거리 구하기
  double dlat = ((this.startLat.abs() - this.endLat.abs()))*92;
  double dLong = ((this.startLong.abs() - this.endLong.abs()))*114;
  double root = pow(dlat, 2) + pow(dlong, 2);
  this._result = sqrt(root);

  int kilo() => (this._result).round();
  */

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;
    latitude = "$lat";
    longitude = "$long";

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: Text("Location")
        ),
         body: Center(
            child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     FlatButton(
                       color: Colors.grey.withOpacity(0.3),
                       child: Text("User Location"),
                       onPressed: () {
                         getCurrentLocation();
                         },
                     ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      locationMessage,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
            ),
         ),
    );
  }
}