import 'package:geolocator/geolocator.dart';

class Location {
  var _longitude;
  var _latitude;

  Future<Position> getPosition() async {
    Position position;

    try {
      LocationPermission permission = await Geolocator.requestPermission();
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _longitude = position.longitude ?? 33.6844;
      _latitude = position.latitude ?? 73.0479;
    } catch (e) {
      print(e);
    }
    return position;
  }

  Future<Map> getCurrentLocation() async {
    await getPosition();
    var longitude = _longitude;
    var latitude = _latitude;
    return ({'Longitude': longitude, 'Latitude': latitude});
  }
}
