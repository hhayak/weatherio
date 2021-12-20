import 'package:weatherio/models/city.dart';

/// Represents mock settings.
class Settings {
  static const City city = City('Bremen', 8.8, 53.0833);
  static const String product = 'astro';
  static const String temperatureUnit = '°C';
  static const Profile profile = Profile(
    'assets/profile_picture.JPG',
    'Hamza Hayak',
    'College Student',
    'Bremen, Germany',
    '+49 175 345 3485',
    'hamazahayak@gmail.com',
    'github.com/hhayak',
  );

  const Settings();
}

/// Represents the information presented in the profile tab.
class Profile {
  final String profileUrl;
  final String name;
  final String title;
  final String location;
  final String phone;
  final String email;
  final String github;

  const Profile(this.profileUrl, this.name, this.title, this.location,
      this.phone, this.email, this.github);
}
