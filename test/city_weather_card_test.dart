import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherio/constants/settings.dart';

import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/utils.dart';
import 'package:weatherio/widgets/city_weather_card.dart';

import 'weather_service_test.dart';

void main() {
  testWidgets('CityWeatherCard test', (WidgetTester tester) async {
    final forecast = Forecast.fromJson(jsonDecode(mockRespBody));
    await tester.pumpWidget(CupertinoApp(home: CityWeatherCard(forecast)));

    // Verify that our counter starts at 0.
    expect(find.text(Settings.city.name), findsOneWidget);
    expect(find.text(buildDateTimeString(forecast.init)), findsOneWidget);
    expect(
        find.text(forecast.dataseries.first.temp2m.toString() +
            Settings.temperatureUnit),
        findsOneWidget);
  });
}
