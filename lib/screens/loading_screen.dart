import 'dart:convert';

import 'package:clime_weather2/screens/location_screen.dart';
import 'package:clime_weather2/services/location.dart';
import 'package:clime_weather2/services/network.dart';
import 'package:clime_weather2/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:geolocator/geolocator.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
/*  late double latitude ;
  late double longitude ;*/

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var weatherData = await  WeatherModel().getLocationWeather();

     Navigator.push(context, MaterialPageRoute(builder: (context){return LocationScreen(weatherData);}));


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white70,
          size: 70,
        ),
      ),
    );
  }
}
