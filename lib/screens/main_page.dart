import 'package:flutter/cupertino.dart';
import 'package:weatherio/controllers/weather_controller.dart';
import 'package:weatherio/screens/weather_tab.dart';
import 'package:weatherio/screens/profile_tab.dart';

/// Main App scaffold with two tabs.
///
/// [WeatherController] is initiated when this page is pushed.
class MainPage extends StatelessWidget {
  final _tabs = const [WeatherTab(), ProfileTab()];
  final _navItems = const [
    BottomNavigationBarItem(
      label: 'Weather',
      icon: Icon(CupertinoIcons.cloud_sun),
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(CupertinoIcons.profile_circled),
    ),
  ];

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (context, index) => _tabs[index],
      tabBar: CupertinoTabBar(
        items: _navItems,
      ),
    );
  }
}
