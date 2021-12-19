import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherio/constants/theme.dart';
import 'package:weatherio/controllers/weather_controller.dart';
import 'package:weatherio/models/city.dart';
import 'package:weatherio/screens/main_page.dart';
import 'package:weatherio/services/weather_service.dart';

void main() {
  Get.put(WeatherService(WeatherioClient()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'Weatherio',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainPage(),
          binding:
              BindingsBuilder.put(() => WeatherController(City(8.8, 53.083))),
        ),
      ],
      theme: lightTheme,
    );
  }
}
