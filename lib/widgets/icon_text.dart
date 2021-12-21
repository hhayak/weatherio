import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weatherio/constants/theme.dart';

/// Icon followed by a text.
/// if [url] is not null, the text becomes a hyperlink.
class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? textColor;
  final Color? iconColor;
  final Uri? url;

  Future<void> _launchUrl() async {
    if (await canLaunch(url.toString())) {
      launch(url.toString());
    }
  }

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    this.url,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor ?? CupertinoColors.systemGrey3,
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: url == null ? null : _launchUrl,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: AppFonts.openSans,
              fontSize: 14,
              color: url != null ? Colors.blue : textColor,
            ),
          ),
        ),
      ],
    );
  }
}