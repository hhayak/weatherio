import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherio/controllers/weather_controller.dart';
import 'package:weatherio/screens/details_page.dart';
import 'package:weatherio/widgets/city_card.dart';

class WeatherTab extends StatelessWidget {
  const WeatherTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Weatherio'),
      ),
      child: Center(
        child: Get.find<WeatherController>().obx(
          (state) => GestureDetector(
            onTap: () {
              Get.to(() => DetailsPage(state!));
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'cityCard',
                  child: CityCard(state!),
                ),
                const Text(
                  'Tap for details',
                  style: TextStyle(
                      color: Colors.indigo, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          onLoading: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
