import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherio/constants/settings.dart';

import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/utils.dart';
import 'package:weatherio/widgets/city_weather_card.dart';

import 'weather_service_test.dart';

void main() {
  // Tests the correct display of the main city weather card.
  testWidgets('CityWeatherCard test', (WidgetTester tester) async {
    final forecast = Forecast.fromJson(jsonDecode(mockRespBody));

    await tester.pumpWidget(CupertinoApp(home: CityWeatherCard(forecast)));

    final dayForecast = forecast.dataseries.first;
    final date = forecast.init.add(Duration(hours: dayForecast.timepoint));

    expect(find.text(Settings.city.name), findsOneWidget);
    expect(find.text(buildDateTimeString(date)), findsOneWidget);
    expect(find.text(dayForecast.temp2m.toString() + Settings.temperatureUnit),
        findsOneWidget);
  });
}
