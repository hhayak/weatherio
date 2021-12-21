import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherio/constants/theme.dart';
import 'package:weatherio/controllers/weather_controller.dart';
import 'package:weatherio/screens/main_page.dart';
import 'package:weatherio/services/weather_service.dart';

/// I assume the Profile and the City don't change. However, they are retrieved
/// from a settings class which acts as a user-defined preference stored in
/// a persistent storage.
///
/// I didn't implement dedicated Exception classes, splash screens and app icons
/// in order to keep the scope of this case study manageable.
///
/// Currently, I don't have access to a MacOS machine. So, a friend of mine
/// with a Mac helped with the IOS build and testing.

void registerServices() {
  Get.put(WeatherService(WeatherioClient()));
}

void main() {
  registerServices();
  runApp(const WeatherioApp());
}

/// Root Widget.
///
/// App Structure:
/// - WeatherApp
///   - MainPage
///     - WeatherTab
///       -DetailsPage
///     - ProfileTab
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
