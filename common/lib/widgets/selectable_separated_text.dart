import 'package:flutter/material.dart';

import '../models/helpers.dart';
import '../models/locale_text.dart';

class SelectableSeparatedText extends StatelessWidget {
  const SelectableSeparatedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final textToAdd = separateText(text);

    final List<Widget> out = [];
    for (var t in textToAdd) {
      final hasTab = t.indexOf(LocaleText.tab) == 0;
      t = hasTab ? t.substring(LocaleText.tab.length) : t;

      final hasBullet = t.indexOf(LocaleText.bullet) == 0;
      t = hasBullet ? t.substring(LocaleText.bullet.length) : t;

      out.add(Padding(
        padding: EdgeInsets.only(left: hasTab ? 20 : 0, bottom: 8),
        child: hasBullet
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('${LocaleText.bullet} '),
                  Expanded(child: SelectableText(t))
                ],
              )
            : SelectableText(t),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: out,
    );
  }
}
