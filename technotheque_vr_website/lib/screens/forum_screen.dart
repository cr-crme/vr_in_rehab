import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/scaffold_navigation.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  static const String route = '/forum';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: texts.forum,
        child: Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                SizedBox(height: 20),
                Text('This section is probably a bad idea'),
              ],
            ),
          ),
        ));
  }
}
