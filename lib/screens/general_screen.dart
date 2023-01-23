import 'package:flutter/material.dart';

import '/providers.dart/locale_text.dart';
import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class GeneralScreen extends StatelessWidget {
  const GeneralScreen({super.key});

  static const String route = '/general';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final textSections = [
      [texts.whatIsVrTitle, texts.whatIsVrText],
      [texts.immersiveVsNonImmersiveTitle, texts.immersiveVsNonImmersiveText],
      [texts.prosOfVrTitle, texts.prosOfVrText],
      [texts.contraindicationVrTitle, texts.contraindicationVrText],
      [texts.websiteNavigationTitle, texts.websiteNavigationText],
    ];

    return ScaffoldNavigation(
        mainTitle: texts.mainTitle,
        subTitle: texts.descriptionAndGenerality,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: textSections
              .map<Widget>((e) => HidableParagraph(
                  title:
                      Text(e[0], style: Theme.of(context).textTheme.titleSmall),
                  paragraph: SelectableText(e[1])))
              .toList(),
        ));
  }
}
