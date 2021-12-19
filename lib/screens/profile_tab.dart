import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherio/constants/profile.dart';
import 'package:weatherio/constants/theme.dart';
import 'package:weatherio/widgets/github_icon.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ProfileMainDisplay(
                pictureUrl: Profile.profileUrl,
                name: Profile.name,
                title: Profile.title,
              ),
              SizedBox(
                height: 10,
              ),
              ProfileContactInfo(
                phone: Profile.phone,
                email: Profile.email,
                location: Profile.location,
                github: Profile.github,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: CupertinoColors.systemGrey3,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontFamily: AppFonts.openSans, fontSize: 14),
        ),
      ],
    );
  }
}

class ProfileContactInfo extends StatelessWidget {
  final String phone;
  final String email;
  final String location;
  final String github;

  const ProfileContactInfo({
    Key? key,
    required this.phone,
    required this.email,
    required this.location,
    required this.github,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconText(icon: Icons.location_on, text: location),
          IconText(icon: Icons.call, text: phone),
          IconText(icon: Icons.email_outlined, text: email),
          IconText(icon: GithubIcon.github_circled, text: github),
        ],
      ),
    );
  }
}

class ProfileMainDisplay extends StatelessWidget {
  final String pictureUrl;
  final String name;
  final String title;

  final nameTextStyle = const TextStyle(
    fontFamily: AppFonts.ptSerif,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  final titleTextStyle = const TextStyle(
    fontFamily: AppFonts.openSans,
    fontSize: 22,
    color: CupertinoColors.systemGrey,
  );

  const ProfileMainDisplay({
    Key? key,
    required this.pictureUrl,
    required this.name,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          pictureUrl,
          width: 90,
          height: 90,
          fit: BoxFit.scaleDown,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: nameTextStyle,
              ),
              Text(
                title,
                style: titleTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
