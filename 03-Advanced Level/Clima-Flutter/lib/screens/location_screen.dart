import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final locationData;
  LocationScreen({this.locationData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  dynamic temp;
  dynamic id;
  String name;
  String condition;
  String message;
  WeatherModel wm = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic locationWeather) {
    setState(() {
      if (locationWeather == null) {
        temp = 0;
        condition = 'Error';
        name = '';
        message = 'Unable to display weather data';
        return;
      }
      dynamic tempq = locationWeather['main']['temp'];
      temp = tempq.toInt();
      id = locationWeather['weather'][0]['id'];
      name = locationWeather['name'];
      message = wm.getMessage(temp.toInt());
      condition = wm.getWeatherIcon(id.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      WeatherModel wm = WeatherModel();
                      dynamic locationData = await wm.getWeatherData();
                      updateUI(locationData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      print(cityName);
                      if (cityName != null) {
                        dynamic cityData = await wm.getCityWeather(cityName);
                        updateUI(cityData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      condition,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in  $name!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// var temp = decodedData['main']['temp'];
// var id = decodedData['weather'][0]['id'];
// var name = decodedData['name'];
// print(temp);
// print(name);
// print(id);
