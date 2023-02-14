import 'package:flutter/material.dart';

import '../models/helpers.dart';
import '../models/locale_text.dart';

class SelectableSeparatedText extends StatelessWidget {
  const SelectableSeparatedText({
    Key? key,
    required this.text,
    this.childToAppend,
  }) : super(key: key);

  final String text;
  final Widget? childToAppend;

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
        child: hasBullet || childToAppend != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasBullet) const Text('${LocaleText.bullet} '),
                  Flexible(child: SelectableText(t)),
                  if (childToAppend != null) childToAppend!,
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
