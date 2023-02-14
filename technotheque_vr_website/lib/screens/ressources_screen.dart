import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class RessourcesScreen extends StatelessWidget {
  const RessourcesScreen({super.key});

  static const String route = '/ressources';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final textSections = [
      [texts.ressourcesListTitle, texts.ressourcesListText],
      [texts.ressourcesContactUsTitle, texts.ressourcesContactUsText],
    ];

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: texts.ressources,
        withBackButton: true,
        child: Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: textSections
                  .map<Widget>((e) => HidableParagraph(
                      title: Text(e[0],
                          style: Theme.of(context).textTheme.titleSmall),
                      paragraph: SelectableSeparatedText(text: e[1])))
                  .toList(),
            ),
          ),
        ));
  }
}


