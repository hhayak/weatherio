import 'package:flutter/material.dart';
import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/widgets/date_card.dart';

class CityCard extends StatelessWidget {
  final Forecast forecast;

  final titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 42,
  );

  final tempStyle = const TextStyle(
    color: Colors.white,
    fontSize: 36,
  );

  const CityCard(this.forecast, {Key? key}) : super(key: key);

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
              DateCard(forecast.init),
              Text(
                forecast.dataseries.first.temp2m.toString() + '°C',
                style: tempStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
