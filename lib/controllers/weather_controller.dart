import 'package:get/get.dart';
import 'package:weatherio/constants/settings.dart';
import 'package:weatherio/models/city.dart';
import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/services/weather_service.dart';

class WeatherController extends GetxController with StateMixin<Forecast> {
  late final City city;
  Forecast? forecast;

  WeatherController();

  @override
  void onReady() {
    setCity().then((_) => fetchAndDisplayForecast());
    super.onReady();
  }

  /// Simulates retrieving the city from persistent storage or other sources.
  Future<void> setCity() async {
    city = Settings.city;
  }

  /// Fetches the forecast and notifies any listening widgets.
  Future<void> fetchAndDisplayForecast() async {
    forecast = await WeatherService.to.fetchForecast(city.lon, city.lat);
    change(forecast, status: RxStatus.success());
  }
}
