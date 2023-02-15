import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableText extends StatelessWidget {
  const ClickableText(
    this.text, {
    Key? key,
    this.url,
  }) : super(key: key);

  final String text;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url ?? text)),
        child: Text(text),
      ),
    );
  }
}
