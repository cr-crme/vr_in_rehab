import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/widgets/main_menu_button.dart';
import '/widgets/scaffold_navigation.dart';
import 'consoles_screen.dart';
import 'generality_screen.dart';
import 'ressources_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  Widget _buildImageRow(BuildContext context, List<String> paths) {
    List<Widget> images = [];
    for (final path in paths) {
      images.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / (paths.length + 1),
          child: Image.network('$rootAssetsPath/images/misc/$path'),
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: images,
    );
  }

  Widget _buildMenuColumn(Map<String, String> items) {
    List<Widget> buttons = [];
    for (final entry in items.entries) {
      buttons.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MainMenuButton(
            title: entry.key,
            route: entry.value,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    final buttons = {
      texts.generalityAndDescription: GeneralityScreen.route,
      texts.consoles: ConsolesScreen.route,
      texts.ressources: RessourcesScreen.route,
    };

    final mainImagesPath = [
      'main_website1.jpg',
      'main_website2.jpg',
      'main_website3.jpg',
    ];
    final logoImagesPath = [
      'logo_fondsquebec.jpg',
      'logo_hsj.jpg',
      'logo_laboinspire.jpg',
      'logo_technopole.jpg',
    ];

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        child: Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      texts.websiteMain,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildMenuColumn(buttons),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Image.network(
                              '$rootAssetsPath/images/misc/logo_technotheque.png'),
                        ),
                      ],
                    ),
                  ),
                  _buildImageRow(context, mainImagesPath),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 40.0, right: 40.0),
                    child: Text(
                      texts.websiteGrants,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _buildImageRow(context, logoImagesPath),
                ],
              ),
            ),
          ),
        ));
  }
}
