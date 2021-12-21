import 'dart:convert';

import 'package:get/get.dart';
import 'package:weatherio/models/forecast.dart';

/// Http client.
///
/// Can override some [GetConnect] members to add custom headers, interceptors,
/// etc...
class WeatherioClient extends GetConnect {}

/// Service to fetch forecast data from the given endpoint.
class WeatherService extends GetxService {
  static String endpoint = 'http://www.7timer.info/bin/api.pl';
  final WeatherioClient client;
  final String product;

  static WeatherService get to => Get.find();

  WeatherService(this.client, [this.product = 'astro']);

  Future<Forecast> fetchForecast(double lon, double lat) async {
    var resp = await client
        .get('$endpoint?lon=$lon&lat=$lat&product=$product&output=json');
    if (resp.hasError) {
      throw Exception(jsonDecode(resp.body));
    } else {
      var forecast = Forecast.fromJson(jsonDecode(resp.body));
      return forecast;
    }
  }
}
