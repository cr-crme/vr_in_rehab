import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/scaffold_navigation.dart';

class NavigatingScreen extends StatelessWidget {
  const NavigatingScreen({super.key});

  static const String route = '/help';
  Widget _separateText(String text) {
    final textToAdd = separateText(text);

    final List<Widget> out = [];
    for (var t in textToAdd) {
      final hasTab = t.indexOf(LocaleText.tab) == 0;
      t = hasTab ? t.substring(LocaleText.tab.length) : t;
      out.add(Padding(
        padding: EdgeInsets.only(left: hasTab ? 50 : 0, bottom: 8),
        child: SelectableText(t),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: out,
    );
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: texts.navigationTitle,
        withBackButton: true,
        child: Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: _separateText(texts.navigationText),
            ),
          ),
        ));
  }
}
