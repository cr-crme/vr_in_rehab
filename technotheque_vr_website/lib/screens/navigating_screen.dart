import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/scaffold_navigation.dart';

class NavigatingScreen extends StatelessWidget {
  const NavigatingScreen({super.key});

  static const String route = '/help';

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
              child: SelectableText(texts.navigationText),
            ),
          ),
        ));
  }
}
