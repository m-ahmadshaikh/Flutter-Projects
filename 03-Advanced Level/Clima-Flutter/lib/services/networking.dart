import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper({this.url});

  Future<dynamic> getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
