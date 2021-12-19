import 'dart:convert';

import 'package:get/get.dart';
import 'package:weatherio/models/forecast.dart';

class WeatherioClient extends GetConnect {}

class WeatherService extends GetxService {
  static String endpoint = 'http://www.7timer.info/bin/api.pl';
  final WeatherioClient client;
  final String product;

  static WeatherService get to => Get.find();

  WeatherService(this.client, [this.product = 'astro']);

  Future<Forecast> fetchForecast(double lon, double lat) async {
    var resp = await client
        .get('$endpoint?lon=$lon&lat=$lat&product=$product&output=json');
    var forecast = Forecast.fromJson(jsonDecode(resp.body));
    forecast.dataseries.removeAt(0);
    return Forecast.fromJson(jsonDecode(resp.body));
  }
}
