import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:technotheque_vr_website/widgets/scaffold_navigation.dart';

import '/widgets/main_menu_button.dart';
import 'consoles_screen.dart';
import 'forum_screen.dart';
import 'generality_screen.dart';
import 'ressources_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
        mainTitle: texts.websiteTitle,
        child: Flexible(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MainMenuButton(
                        title: texts.generalityAndDescription,
                        route: GeneralityScreen.route,
                      ),
                      const SizedBox(height: 25),
                      MainMenuButton(
                        title: texts.consoles,
                        route: ConsolesScreen.route,
                      ),
                      const SizedBox(height: 25),
                      MainMenuButton(
                        title: texts.forum,
                        route: ForumScreen.route,
                      ),
                      const SizedBox(height: 25),
                      MainMenuButton(
                        title: texts.ressources,
                        route: RessourcesScreen.route,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 250,
                    child: Image.asset(
                        'packages/common/assets/images/placeholder.png'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
