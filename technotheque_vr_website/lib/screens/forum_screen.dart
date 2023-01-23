import 'package:flutter/material.dart';

import '/providers.dart/locale_text.dart';
import '/widgets/scaffold_navigation.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  static const String route = '/forum';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
        mainTitle: texts.mainTitle,
        subTitle: texts.forum,
        child: Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              SizedBox(height: 20),
              Text('This section is probably a bad idea'),
            ],
          ),
        ));
  }
}
