import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class GeneralityScreen extends StatelessWidget {
  const GeneralityScreen({super.key});

  static const String route = '/general';

  Widget _buildImage(BuildContext context,
      {required String path, required String title}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Image.network(path),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildHidable(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return HidableParagraph(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        paragraph: child);
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: texts.generalityAndDescription,
        withBackButton: true,
        child: Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildHidable(context,
                    title: texts.generalityWhatIsVrTitle,
                    child: SelectableSeparatedText(
                        text: texts.generalityWhatIsVrText)),
                _buildHidable(context,
                    title: texts.generalityImmersiveVsNonImmersiveTitle,
                    child: Column(
                      children: [
                        SelectableSeparatedText(
                            text: texts.generalityImmersiveVsNonImmersiveText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildImage(context,
                                path:
                                    '$rootAssetsPath/images/misc/main_website2.jpg',
                                title: texts.nonImmersiveGame),
                            _buildImage(context,
                                path:
                                    '$rootAssetsPath/images/misc/main_website3.jpg',
                                title: texts.immersiveGame),
                          ],
                        )
                      ],
                    )),
                _buildHidable(context,
                    title: texts.generalityProsOfVrTitle,
                    child: SelectableSeparatedText(
                        text: texts.generalityProsOfVrText)),
                _buildHidable(context,
                    title: texts.generalityContraindicationVrTitle,
                    child: SelectableSeparatedText(
                        text: texts.generalityContraindicationVrText)),
              ],
            ),
          ),
        ));
  }
}
