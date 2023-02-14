import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/screens/games_screen.dart';
import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class ConsolesScreen extends StatelessWidget {
  const ConsolesScreen({super.key});

  static const String route = '/consoles';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
      mainTitle: texts.websiteTitle,
      subTitle: texts.consolesAndGames,
      withBackButton: true,
      child: Flexible(
        child: SingleChildScrollView(
          child: FutureBuilder<List<Console>>(
            future: readConsoles(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: snapshot.data!
                    .map<Widget>((console) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: HidableParagraph(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textToExpand: texts.moreInformation,
                            title: Column(
                              children: [
                                Text(console.title,
                                    style:
                                        Theme.of(context).textTheme.titleSmall),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Image.network(
                                    console.imagePath,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(),
                                  ),
                                ),
                              ],
                            ),
                            paragraph: _ConsoleDescription(
                              console: console,
                              onTap: () => Navigator.of(context).pushNamed(
                                  GamesScreen.route,
                                  arguments: console),
                            ),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ConsoleDescription extends StatelessWidget {
  const _ConsoleDescription({
    required this.console,
    required this.onTap,
  });

  final Console console;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    final textStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white);
    const titleStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Color.fromARGB(255, 123, 255, 213));

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWithTitle(
              texts.consoleImmersiveTitle, console.immersive[texts.language]!,
              titleStyle: titleStyle, textStyle: textStyle),
          TextWithTitle(
              texts.consoleTargetTitle, console.target[texts.language]!,
              titleStyle: titleStyle, textStyle: textStyle),
          TextWithTitle(texts.consoleRequiredSpaceTitle,
              console.requiredSpace[texts.language]!,
              titleStyle: titleStyle, textStyle: textStyle),
          TextWithTitle(texts.consolePrecautionsTitle,
              console.precautions[texts.language]!,
              titleStyle: titleStyle, textStyle: textStyle),
          TextWithTitle(
              texts.consoleEquipmentsTitle, console.equipments[texts.language]!,
              titleStyle: titleStyle, textStyle: textStyle),
          TextWithTitle(texts.consoleCostsTitle, console.costs[texts.language]!,
              titleStyle: titleStyle, textStyle: textStyle),
          TextButton(
            onPressed: onTap,
            child: Text(texts.consoleClickHereForGames),
          ),
        ],
      ),
    );
  }
}
