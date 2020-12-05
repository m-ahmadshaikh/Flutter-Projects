import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    WeatherModel wm = WeatherModel();
    dynamic decodedData = await wm.getWeatherData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationData: decodedData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    ));
  }
}
