import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherio/constants/settings.dart';

import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/screens/details_page.dart';
import 'package:weatherio/utils.dart';

import 'weather_service_test.dart';

void main() {
  // Tests tapping the 'next' button twice, and checks correct state update.
  testWidgets('DetailsPage Test', (WidgetTester tester) async {
    final forecast = Forecast.fromJson(jsonDecode(mockRespBody));
    int offset = 0;
    var dayForecast = forecast.dataseries[offset];
    DateTime date = forecast.init.add(Duration(hours: dayForecast.timepoint));
    await tester.pumpWidget(CupertinoApp(home: DetailsPage(forecast)));
    await tester.pumpAndSettle();

    expect(find.text(Settings.city.name), findsOneWidget);
    expect(find.text('Temperature'), findsOneWidget);
    expect(find.text('Cloud Cover'), findsOneWidget);
    expect(find.text('Lifted Index'), findsOneWidget);
    expect(find.text('Seeing'), findsOneWidget);
    expect(find.text('Transparency'), findsOneWidget);
    expect(find.text(buildDateTimeString(date)), findsOneWidget);
    expect(
        find.text(dayForecast.temp2m.toString() +
            Settings.temperatureUnit),
        findsOneWidget);
    // Tap next
    await tester.tap(find.byIcon(CupertinoIcons.right_chevron).first);
    await tester.tap(find.byIcon(CupertinoIcons.right_chevron).first);
    offset = offset + 2;
    dayForecast = forecast.dataseries[offset];
    date = forecast.init.add(Duration(hours: dayForecast.timepoint));
    await tester.pumpAndSettle();

    expect(
        find.text(dayForecast.temp2m.toString() +
            Settings.temperatureUnit),
        findsOneWidget);
    expect(find.text(buildDateTimeString(date)), findsOneWidget);
  });
}
