import 'package:flutter/material.dart';

import '/providers.dart/locale_text.dart';
import '/widgets/expandable_paragraph.dart';

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
              child: Text(
                texts.mainTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: textSections
                  .map<Widget>(
                      (e) => ExpandableParagraph(title: e[0], text: e[1]))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
