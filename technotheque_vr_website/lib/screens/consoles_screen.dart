import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/screens/games_screen.dart';
import '/widgets/hidable_paragraph.dart';
import '/widgets/scaffold_navigation.dart';

class ConsolesScreen extends StatelessWidget {
  const ConsolesScreen({super.key});

  static const String route = '/consoles';

  void _clickedConsole(BuildContext context, Console console) async {
    final navigator = Navigator.of(context);
    final allGames =
        await readGames('packages/common/assets/game_analyses/all_games.json');
    final games = allGames.where((game) => game.console == console).toList();
    navigator.pushNamed(GamesScreen.route, arguments: [console, games]);
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    final consoles = [
      [
        texts.consoleBootleBlastTitle,
        _ConsoleDescription(
          immersive: texts.consoleBootleBlastImmersive,
          target: texts.consoleBootleBlastTarget,
          requiredSpace: texts.consoleBootleBlastRequiredSpace,
          precautions: texts.consoleBootleBlastPrecautions,
          equipments: texts.consoleBootleBlastEquipments,
          costs: texts.consoleBootleBlastCosts,
          imagePath: 'packages/common/assets/images/placeholder.png',
          onTap: () => _clickedConsole(context, Console.bootleBlast),
        )
      ],
      [
        texts.consoleHabilupTitle,
        _ConsoleDescription(
          immersive: texts.consoleHabilupImmersive,
          target: texts.consoleHabilupTarget,
          requiredSpace: texts.consoleHabilupRequiredSpace,
          precautions: texts.consoleHabilupPrecautions,
          equipments: texts.consoleHabilupEquipments,
          costs: texts.consoleHabilupCosts,
          imagePath: 'packages/common/assets/images/placeholder.png',
          onTap: () => _clickedConsole(context, Console.habilup),
        )
      ],
      [
        texts.consoleViveTitle,
        _ConsoleDescription(
          immersive: texts.consoleViveImmersive,
          target: texts.consoleViveTarget,
          requiredSpace: texts.consoleViveRequiredSpace,
          precautions: texts.consoleVivePrecautions,
          equipments: texts.consoleViveEquipments,
          costs: texts.consoleViveCosts,
          imagePath: 'packages/common/assets/images/placeholder.png',
          onTap: () => _clickedConsole(context, Console.vive),
        )
      ],
      [
        texts.consoleJintronixTitle,
        _ConsoleDescription(
          immersive: texts.consoleJintronixImmersive,
          target: texts.consoleJintronixTarget,
          requiredSpace: texts.consoleJintronixRequiredSpace,
          precautions: texts.consoleJintronixPrecautions,
          equipments: texts.consoleJintronixEquipments,
          costs: texts.consoleJintronixCosts,
          imagePath: 'packages/common/assets/images/placeholder.png',
          onTap: () => _clickedConsole(context, Console.jintronix),
        )
      ],
      [
        texts.consoleNintendoSwitchTitle,
        _ConsoleDescription(
          immersive: texts.consoleNintendoSwitchImmersive,
          target: texts.consoleNintendoSwitchTarget,
          requiredSpace: texts.consoleNintendoSwitchRequiredSpace,
          precautions: texts.consoleNintendoSwitchPrecautions,
          equipments: texts.consoleNintendoSwitchEquipments,
          costs: texts.consoleNintendoSwitchCosts,
          imagePath: 'packages/common/assets/images/placeholder.png',
          onTap: () => _clickedConsole(context, Console.nintendoSwitch),
        )
      ],
      [
        texts.consoleOculusTitle,
        _ConsoleDescription(
          immersive: texts.consoleOculusImmersive,
          target: texts.consoleOculusTarget,
          requiredSpace: texts.consoleOculusRequiredSpace,
          precautions: texts.consoleOculusPrecautions,
          equipments: texts.consoleOculusEquipments,
          costs: texts.consoleOculusCosts,
          imagePath: 'packages/common/assets/images/placeholder.png',
          onTap: () => _clickedConsole(context, Console.oculus),
        )
      ],
      [
        texts.consoleXboxTitle,
        _ConsoleDescription(
          immersive: texts.consoleXboxImmersive,
          target: texts.consoleXboxTarget,
          requiredSpace: texts.consoleXboxRequiredSpace,
          precautions: texts.consoleXboxPrecautions,
          equipments: texts.consoleXboxEquipments,
          costs: texts.consoleXboxCosts,
          imagePath: 'packages/common/assets/images/placeholder.png',
          onTap: () => _clickedConsole(context, Console.xbox),
        )
      ],
    ];

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        subTitle: texts.consoles,
        withBackButton: true,
        child: Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: consoles
                  .map<Widget>((e) => HidableParagraph(
                      title: Text(e[0] as String,
                          style: Theme.of(context).textTheme.titleSmall),
                      paragraph: e[1] as Widget))
                  .toList(),
            ),
          ),
        ));
  }
}

class _ConsoleDescription extends StatelessWidget {
  const _ConsoleDescription({
    required this.immersive,
    required this.target,
    required this.requiredSpace,
    required this.precautions,
    required this.equipments,
    required this.costs,
    required this.imagePath,
    required this.onTap,
  });

  final String immersive;
  final String target;
  final String requiredSpace;
  final String precautions;
  final String equipments;
  final String costs;

  final String imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    const bullet = LocaleText.bullet;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                  '$bullet ${texts.consoleImmersiveTitle}${texts.colon} $immersive\n'
                  '$bullet ${texts.consoleTargetTitle}${texts.colon} $target\n'
                  '$bullet ${texts.consoleRequiredSpaceTitle}${texts.colon} $requiredSpace\n'
                  '$bullet ${texts.consolePrecautionsTitle}${texts.colon} $precautions\n'
                  '$bullet ${texts.consoleEquipmentsTitle}${texts.colon} $equipments\n'
                  '$bullet ${texts.consoleCostsTitle}${texts.colon} $costs\n'),
              TextButton(
                onPressed: onTap,
                child: Text(texts.consoleClickHereForGames),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 3,
          padding: const EdgeInsets.only(right: 15),
          child: Image.asset(imagePath),
        ),
      ],
    );
  }
}
