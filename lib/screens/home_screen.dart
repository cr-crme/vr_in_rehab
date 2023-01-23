import 'package:flutter/material.dart';
import 'package:technotheque_vr_website/widgets/scaffold_navigation.dart';

import '/providers.dart/locale_text.dart';
import '/screens/consoles.dart';
import '/screens/general_screen.dart';
import '/widgets/main_menu_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return ScaffoldNavigation(
        mainTitle: texts.mainTitle,
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
                    title: texts.descriptionAndGenerality,
                    route: GeneralScreen.route,
                  ),
                  const SizedBox(height: 25),
                  MainMenuButton(
                    title: texts.consoles,
                    route: Consoles.route,
                  ),
                  const SizedBox(height: 25),
                  MainMenuButton(
                    title: texts.forum,
                    route: GeneralScreen.route,
                  ),
                  const SizedBox(height: 25),
                  MainMenuButton(
                    title: texts.ressources,
                    route: GeneralScreen.route,
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                child: Image.asset('assets/images/placeholder.png'),
              ),
            ],
          ),
        ));
  }
}
