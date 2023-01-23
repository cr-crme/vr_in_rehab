import 'package:flutter/material.dart';

import '/providers.dart/locale_text.dart';
import '/widgets/hidable_paragraph.dart';

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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    texts.mainTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    texts.descriptionAndGenerality,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: textSections
                  .map<Widget>((e) => HidableParagraph(
                      title: Text(e[0],
                          style: Theme.of(context).textTheme.titleSmall),
                      paragraph: SelectableText(e[1])))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
