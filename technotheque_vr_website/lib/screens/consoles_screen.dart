import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/screens/games_screen.dart';
import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class ConsolesScreen extends StatelessWidget {
  const ConsolesScreen({super.key});

  static const String route = '/consoles';

  Future<List<Console>> _fetchConsoles() async {
    return await readConsoles();
  }

  void _clickedConsole(BuildContext context, Console console) async {
    final navigator = Navigator.of(context);
    final allGames = await readGames();
    final games =
        allGames.where((game) => game.console == console.title).toList();
    navigator.pushNamed(GamesScreen.route, arguments: [console, games]);
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
      mainTitle: texts.websiteTitle,
      subTitle: texts.consoles,
      withBackButton: true,
      child: Flexible(
        child: SingleChildScrollView(
          child: FutureBuilder<List<Console>>(
            future: _fetchConsoles(),
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
                                  child: Image.network(console.imagePath),
                                ),
                              ],
                            ),
                            paragraph: _ConsoleDescription(
                              console: console,
                              onTap: () => _clickedConsole(context, console),
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
    const bullet = LocaleText.bullet;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
            '$bullet ${texts.consoleImmersiveTitle}${texts.colon} ${console.immersive[texts.language]}\n'
            '$bullet ${texts.consoleTargetTitle}${texts.colon} ${console.target[texts.language]}\n'
            '$bullet ${texts.consoleRequiredSpaceTitle}${texts.colon} ${console.requiredSpace[texts.language]}\n'
            '$bullet ${texts.consolePrecautionsTitle}${texts.colon} ${console.precautions[texts.language]}\n'
            '$bullet ${texts.consoleEquipmentsTitle}${texts.colon} ${console.equipments[texts.language]}\n'
            '$bullet ${texts.consoleCostsTitle}${texts.colon} ${console.costs[texts.language]}\n'),
        TextButton(
          onPressed: onTap,
          child: Text(texts.consoleClickHereForGames),
        ),
      ],
    );
  }
}
