import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherio/constants/settings.dart';
import 'package:weatherio/constants/theme.dart';
import 'package:weatherio/widgets/github_icon.dart';
import 'package:weatherio/widgets/icon_text.dart';

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
            children:  [
              ProfileMainDisplay(
                pictureUrl: Settings.profile.profileUrl,
                name: Settings.profile.name,
                title: Settings.profile.title,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileContactInfo(
                phone: Settings.profile.phone,
                email: Settings.profile.email,
                location: Settings.profile.location,
                github: Settings.profile.github,
              ),
            ],
          ),
        ),
      ),
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
          IconText(
            icon: Icons.email_outlined,
            text: email,
            url: Uri(scheme: 'mailto', path: email),
          ),
          IconText(
            icon: GithubIcon.githubCircled,
            text: github,
            url: Uri(scheme: 'https', path: github),
          ),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            pictureUrl,
            width: 90,
            //height: 90,
            fit: BoxFit.scaleDown,
            errorBuilder: (context, e, trace) => const FlutterLogo(),
          ),
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
