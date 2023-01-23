import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class GeneralityScreen extends StatelessWidget {
  const GeneralityScreen({super.key});

  static const String route = '/general';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final textSections = [
      [texts.generalityWhatIsVrTitle, texts.generalityWhatIsVrText],
      [
        texts.generalityImmersiveVsNonImmersiveTitle,
        texts.generalityImmersiveVsNonImmersiveText
      ],
      [texts.generalityProsOfVrTitle, texts.generalityProsOfVrText],
      [
        texts.generalityContraindicationVrTitle,
        texts.generalityContraindicationVrText
      ],
      [
        texts.generalityWebsiteNavigationTitle,
        texts.generalityWebsiteNavigationText
      ],
    ];

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: texts.generalityAndDescription,
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
