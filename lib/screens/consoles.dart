import 'package:flutter/material.dart';

import '/providers.dart/locale_text.dart';
import '/widgets/hidable_paragraph.dart';

class Consoles extends StatelessWidget {
  const Consoles({super.key});

  static const String route = '/consoles';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final consoles = [
      [
        texts.consoleBootleBlastTitle,
        _ConsoleDescription(
          'bootleBlast',
          immersive: texts.consoleBootleBlastImmersive,
          target: texts.consoleBootleBlastTarget,
          requiredSpace: texts.consoleBootleBlastRequiredSpace,
          precautions: texts.consoleBootleBlastPrecautions,
          equipments: texts.consoleBootleBlastEquipments,
          costs: texts.consoleBootleBlastCosts,
          imagePath: 'assets/images/placeholder.png',
          routeOnClick: null,
        )
      ],
      [
        texts.consoleHabilupTitle,
        _ConsoleDescription(
          'habilup',
          immersive: texts.consoleHabilupImmersive,
          target: texts.consoleHabilupTarget,
          requiredSpace: texts.consoleHabilupRequiredSpace,
          precautions: texts.consoleHabilupPrecautions,
          equipments: texts.consoleHabilupEquipments,
          costs: texts.consoleHabilupCosts,
          imagePath: 'assets/images/placeholder.png',
          routeOnClick: null,
        )
      ],
      [
        texts.consoleViveTitle,
        _ConsoleDescription(
          'vive',
          immersive: texts.consoleViveImmersive,
          target: texts.consoleViveTarget,
          requiredSpace: texts.consoleViveRequiredSpace,
          precautions: texts.consoleVivePrecautions,
          equipments: texts.consoleViveEquipments,
          costs: texts.consoleViveCosts,
          imagePath: 'assets/images/placeholder.png',
          routeOnClick: null,
        )
      ],
      [
        texts.consoleJintronixTitle,
        _ConsoleDescription(
          'jintronix',
          immersive: texts.consoleJintronixImmersive,
          target: texts.consoleJintronixTarget,
          requiredSpace: texts.consoleJintronixRequiredSpace,
          precautions: texts.consoleJintronixPrecautions,
          equipments: texts.consoleJintronixEquipments,
          costs: texts.consoleJintronixCosts,
          imagePath: 'assets/images/placeholder.png',
          routeOnClick: null,
        )
      ],
      [
        texts.consoleNintendoSwitchTitle,
        _ConsoleDescription(
          'nintendo switch',
          immersive: texts.consoleNintendoSwitchImmersive,
          target: texts.consoleNintendoSwitchTarget,
          requiredSpace: texts.consoleNintendoSwitchRequiredSpace,
          precautions: texts.consoleNintendoSwitchPrecautions,
          equipments: texts.consoleNintendoSwitchEquipments,
          costs: texts.consoleNintendoSwitchCosts,
          imagePath: 'assets/images/placeholder.png',
          routeOnClick: null,
        )
      ],
      [
        texts.consoleOculusTitle,
        _ConsoleDescription(
          'oculus',
          immersive: texts.consoleOculusImmersive,
          target: texts.consoleOculusTarget,
          requiredSpace: texts.consoleOculusRequiredSpace,
          precautions: texts.consoleOculusPrecautions,
          equipments: texts.consoleOculusEquipments,
          costs: texts.consoleOculusCosts,
          imagePath: 'assets/images/placeholder.png',
          routeOnClick: null,
        )
      ],
      [
        texts.consoleXboxTitle,
        _ConsoleDescription(
          'xbox',
          immersive: texts.consoleXboxImmersive,
          target: texts.consoleXboxTarget,
          requiredSpace: texts.consoleXboxRequiredSpace,
          precautions: texts.consoleXboxPrecautions,
          equipments: texts.consoleXboxEquipments,
          costs: texts.consoleXboxCosts,
          imagePath: 'assets/images/placeholder.png',
          routeOnClick: null,
        )
      ],
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
              children: consoles
                  .map<Widget>((e) => HidableParagraph(
                      title: Text(e[0] as String,
                          style: Theme.of(context).textTheme.titleMedium),
                      paragraph: e[1] as Widget))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConsoleDescription extends StatelessWidget {
  const _ConsoleDescription(
    this.consoleName, {
    required this.immersive,
    required this.target,
    required this.requiredSpace,
    required this.precautions,
    required this.equipments,
    required this.costs,
    required this.imagePath,
    required this.routeOnClick,
  });

  final String consoleName;

  final String immersive;
  final String target;
  final String requiredSpace;
  final String precautions;
  final String equipments;
  final String costs;

  final String imagePath;
  final String? routeOnClick;

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
                onPressed: () {},
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
