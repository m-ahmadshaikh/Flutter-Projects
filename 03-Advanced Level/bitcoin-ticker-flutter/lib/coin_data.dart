import 'package:http/http.dart';
import 'dart:convert' as convert;

const List<String> currenciesList = [
  'PKR',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getBTC(String curren) async {
    Response response = await get(
      'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$curren',
      // Send authorization headers to the backend.
      headers: {'x-ba-key': 'YzEzZGJhZTkwNzVmNGNhZmJjZGUwZWZjZTllNjRjMzM'},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<dynamic> getETH(String curren) async {
    Response response = await get(
      'https://apiv2.bitcoinaverage.com/indices/global/ticker/ETH$curren',
      // Send authorization headers to the backend.
      headers: {'x-ba-key': 'YzEzZGJhZTkwNzVmNGNhZmJjZGUwZWZjZTllNjRjMzM'},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<dynamic> getLTC(String curren) async {
    Response response = await get(
      'https://apiv2.bitcoinaverage.com/indices/global/ticker/LTC$curren',
      // Send authorization headers to the backend.
      headers: {'x-ba-key': 'YzEzZGJhZTkwNzVmNGNhZmJjZGUwZWZjZTllNjRjMzM'},
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
