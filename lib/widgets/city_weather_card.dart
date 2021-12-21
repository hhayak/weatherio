import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherio/constants/settings.dart';
import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/widgets/date_card.dart';

class CityWeatherCard extends StatelessWidget {
  final Forecast forecast;
  final VoidCallback? onRefresh;

  final titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 42,
  );

  final tempStyle = const TextStyle(
    color: Colors.white,
    fontSize: 36,
  );

  const CityWeatherCard(this.forecast, {Key? key, this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dayForecast = forecast.dataseries.first;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.indigoAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // The scroll view prevents overflow when animating.
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Settings.city.name,
                      style: titleStyle,
                    ),
                    DateCard(forecast.init
                        .add(Duration(hours: dayForecast.timepoint))),
                    Text(
                      dayForecast.temp2m.toString() + Settings.temperatureUnit,
                      style: tempStyle,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: onRefresh,
                  icon: const Icon(
                    CupertinoIcons.refresh,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
