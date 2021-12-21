import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherio/constants/settings.dart';
import 'package:weatherio/models/forecast.dart';
import 'package:weatherio/widgets/date_card.dart';
import 'package:weatherio/widgets/icon_text.dart';

class DetailsPage extends StatelessWidget {
  final Forecast forecast;

  const DetailsPage(this.forecast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
              tag: 'cityCard',
              child: CityNameCard('Bremen'),
            ),
            DataColumn(forecast),
          ],
        ),
      ),
    );
  }
}

class DataColumn extends StatefulWidget {
  final Forecast forecast;

  const DataColumn(this.forecast, {Key? key}) : super(key: key);

  @override
  State<DataColumn> createState() => _DataColumnState();
}

class _DataColumnState extends State<DataColumn> {
  final int _incrementValue = 3;
  late int _offset;

  @override
  void initState() {
    _offset = 0;
    super.initState();
  }

  void _next() {
    setState(() {
      _offset++;
    });
  }

  void _prev() {
    setState(() {
      _offset--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dayForecast = widget.forecast.dataseries[_offset];
    return Column(
      children: [
        DataRow(
          icon: CupertinoIcons.thermometer,
          title: 'Temperature',
          data: dayForecast.temp2m.toString() + Settings.temperatureUnit,
        ),
        DataRow(
          icon: CupertinoIcons.cloud,
          title: 'Cloud Cover',
          data: dayForecast.cloudcover.toString(),
        ),
        DataRow(
          // Hard to represent the Lifted Index. A lifted hand index is the
          // next best thing :)
          icon: CupertinoIcons.hand_draw,
          title: 'Lifted Index',
          data: dayForecast.liftedIndex.toString(),
        ),
        DataRow(
          icon: Icons.auto_awesome_outlined,
          title: 'Seeing',
          data: dayForecast.seeing.toString(),
        ),
        DataRow(
          icon: Icons.lens_blur_outlined,
          title: 'Transparency',
          data: dayForecast.transparency.toString(),
        ),
        Card(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'Before ${_incrementValue}h',
                onPressed: _offset > 0 ? _prev : null,
                icon: const Icon(CupertinoIcons.left_chevron),
              ),
              DateCard(widget.forecast.init
                  .add(Duration(hours: dayForecast.timepoint))),
              IconButton(
                tooltip: 'After ${_incrementValue}h',
                onPressed: _offset < widget.forecast.dataseries.length - 1
                    ? _next
                    : null,
                icon: const Icon(CupertinoIcons.right_chevron),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DataRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;

  const DataRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconText(
              icon: icon,
              iconColor: Colors.indigo,
              text: title,
              textColor: CupertinoColors.systemGrey,
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}

class CityNameCard extends StatelessWidget {
  final String cityName;

  const CityNameCard(this.cityName, {Key? key}) : super(key: key);

  final titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 42,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Card(
        color: Colors.indigoAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cityName,
              style: titleStyle,
            ),
          ),
        ),
      ),
    );
  }
}
