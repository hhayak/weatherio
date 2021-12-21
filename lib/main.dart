import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherio/constants/theme.dart';
import 'package:weatherio/controllers/weather_controller.dart';
import 'package:weatherio/screens/main_page.dart';
import 'package:weatherio/services/weather_service.dart';

void registerServices() {
  Get.put(WeatherService(WeatherioClient()));
}

void main() {
  registerServices();
  runApp(const WeatherioApp());
}

/// Root widget.
///
/// I assume the Profile and the City don't change. However, they are retrieved
/// from a settings class which acts as a user defined preference stored in
/// a persistent storage.
class WeatherioApp extends StatelessWidget {
  const WeatherioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Weatherio',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainPage(),
          binding: BindingsBuilder.put(() => WeatherController()),
        ),
      ],
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
