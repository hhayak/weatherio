import 'package:get/get.dart';
import 'package:weatherio/models/city.dart';
import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/services/weather_service.dart';

class WeatherController extends GetxController with StateMixin<Forecast> {
  final City city;
  Forecast? forecast;

  WeatherController(this.city);

  @override
  void onReady() {
    getForecast();
    super.onReady();
  }

  Future<void> getForecast() async {
    forecast = await WeatherService.to.getForecast(city.lon, city.lat);
    change(forecast, status: RxStatus.success());
  }
}
