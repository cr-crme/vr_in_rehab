import 'package:flutter/material.dart';

import '/providers.dart/locale_text.dart';
import '/widgets/main_menu_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);

    return Scaffold(
      body: Column(
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainMenuButton(title: texts.descriptionAndGenerality),
                      MainMenuButton(title: texts.consoles),
                      MainMenuButton(title: texts.forum),
                      MainMenuButton(title: texts.ressources),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset('assets/images/placeholder.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
