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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(texts.mainTitle,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MainMenuButton(title: 'Coucou'),
                      MainMenuButton(title: 'Coucou'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
