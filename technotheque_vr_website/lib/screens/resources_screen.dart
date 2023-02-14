import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  static const String route = '/resources';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: texts.resources,
        withBackButton: true,
        child: Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HidableParagraph(
                    title: Text(texts.resourcesListTitle,
                        style: Theme.of(context).textTheme.titleSmall),
                    paragraph: Column(
                      children: texts.resourcesListText
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('${LocaleText.bullet} '),
                                    Expanded(
                                        child: e.toWidget(color: Colors.white)),
                                  ],
                                ),
                              ))
                          .toList(),
                    )),
                HidableParagraph(
                    title: Text(texts.resourcesInternetTitle,
                        style: Theme.of(context).textTheme.titleSmall),
                    paragraph: Column(
                        children: texts.resourcesInternetText
                            .map<Widget>(
                              (e) => Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: SelectableSeparatedText(
                                    text: e[0],
                                    childToAppend: ClickableText(e[1]),
                                  )),
                            )
                            .toList())),
                HidableParagraph(
                    title: Text(texts.resourcesContactUsTitle,
                        style: Theme.of(context).textTheme.titleSmall),
                    paragraph: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SelectableSeparatedText(
                          text: texts.resourcesContactUsText,
                          childToAppend: ClickableText(
                            texts.email,
                            url: 'mailto:${texts.email}',
                          )),
                    )),
              ],
            ),
          ),
        ));
  }
}
