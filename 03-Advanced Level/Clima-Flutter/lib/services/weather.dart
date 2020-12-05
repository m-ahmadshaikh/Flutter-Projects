import 'networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future getCityWeather(String city) async {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=02f579e2d965a4666ed6192819703923&units=metric';
    NetworkHelper nh = NetworkHelper(url: url);
    dynamic decodedData = await nh.getData();
    print(decodedData);
    return decodedData;
  }

  Future getWeatherData() async {
    Location location = Location();
    Map loc = await location.getCurrentLocation();
    double lat = loc['Latitude'];
    double lon = loc['Longitude'];
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=02f579e2d965a4666ed6192819703923&units=metric';
    NetworkHelper nh = NetworkHelper(url: url);
    dynamic decodedData = await nh.getData();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
