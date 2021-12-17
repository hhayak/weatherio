import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherio/controllers/weather_controller.dart';
import 'package:weatherio/models/forecast.dart';

class WeatherTab extends StatelessWidget {
  const WeatherTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Get.find<WeatherController>().obx(
        (state) => CityCard(state!),
        onLoading: const CircularProgressIndicator(),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final Forecast forecast;

  final titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 42,
  );

  final dateStyle = const TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.indigoAccent,
    fontSize: 16,
  );

  final tempStyle = const TextStyle(
    color: Colors.white,
    fontSize: 36,
  );

  const CityCard(this.forecast, {Key? key}) : super(key: key);

  String _buildDateTimeString(DateTime d) {
    return '${d.day}.${d.month}.${d.year} at ${d.hour}h00';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.indigoAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bremen',
                style: titleStyle,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    _buildDateTimeString(forecast.init),
                    style: dateStyle,
                  ),
                ),
              ),
              Text(
                forecast.dataseries.first.temp2m.toString() + '°',
                style: tempStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
