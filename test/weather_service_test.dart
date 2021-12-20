import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:weatherio/constants/settings.dart';
import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/services/weather_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'weather_service_test.mocks.dart';

@GenerateMocks([WeatherioClient])
void main() {
  test('Fetch Forecast', () async {
    const city = Settings.city;
    final service = WeatherService(MockWeatherioClient());
    when(service.client.get(
            '${WeatherService.endpoint}?lon=${city.lon}&lat=${city.lat}&product=${service.product}&output=json',
            headers: null,
            contentType: null,
            query: null,
            decoder: null))
        .thenAnswer((_) async => mockRespSuccessful);
    final forecast = await service.fetchForecast(city.lon, city.lat);

    expect(forecast, isA<Forecast>());
    expect(forecast.dataseries.length, equals(3));
    expect(forecast.dataseries.last.timepoint, equals(9));
  });
}

const mockRespSuccessful = Response(body: mockRespBody, statusCode: 200);

const mockRespBody =
    '{ "product" : "astro" , "init" : "2021122012" , "dataseries" : [ { "timepoint" : 3, "cloudcover" : 1, "seeing" : 8, "transparency" : 3, "lifted_index" : 15, "rh2m" : 13, "wind10m" : { "direction" : "N", "speed" : 2 }, "temp2m" : 1, "prec_type" : "none" }, { "timepoint" : 6, "cloudcover" : 1, "seeing" : 8, "transparency" : 3, "lifted_index" : 15, "rh2m" : 12, "wind10m" : { "direction" : "N", "speed" : 2 }, "temp2m" : -1, "prec_type" : "none" }, { "timepoint" : 9, "cloudcover" : 3, "seeing" : 8, "transparency" : 3, "lifted_index" : 15, "rh2m" : 13, "wind10m" : { "direction" : "NE", "speed" : 2 }, "temp2m" : -1, "prec_type" : "none" }] }';
