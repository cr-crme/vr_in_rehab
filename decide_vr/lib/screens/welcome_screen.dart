import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/common/widgets/language_switcher.dart';
import '/common/widgets/start_button.dart';
import 'fill_info_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const route = '/';

  void _clickStartCallback(BuildContext context) {
    Navigator.of(context).pushNamed(FillingInfoScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child:
                        Image.network('$rootAssetsPath/images/misc/logo.png'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  LocaleText.of(context).appExplanation,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              const LanguageSwitcher(width: 125, height: 35),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: StartButton(
                  LocaleText.of(context).start,
                  width: 150,
                  clickCallback: _clickStartCallback,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
