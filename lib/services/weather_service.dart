import 'dart:convert';

import 'package:get/get.dart';
import 'package:weatherio/models/forecast.dart';

class WeatherioClient extends GetConnect {
  static String endpoint = 'http://www.7timer.info/bin/api.pl';
  @override
  void onInit() {
    httpClient.baseUrl = endpoint;
  }
}

class WeatherService extends GetxService {
  static String endpoint = 'http://www.7timer.info/bin/api.pl';
  final WeatherioClient client;

  static WeatherService get to => Get.find();

  WeatherService(this.client);

  Future<Forecast> getForecast(double lon, double lat) async {
    var resp = await client
        .get('$endpoint?lon=$lon&lat=$lat&product=astro&output=json');
    var forecast = Forecast.fromJson(jsonDecode(resp.body));
    forecast.dataseries.removeAt(0);
    return Forecast.fromJson(jsonDecode(resp.body));
  }
}
