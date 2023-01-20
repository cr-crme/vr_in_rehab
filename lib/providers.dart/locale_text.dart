import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleText with ChangeNotifier {
  LocaleText({required this.language});

  void setLanguage(language) {
    this.language = language;
    notifyListeners();
  }

  String language;

  static LocaleText of(BuildContext context, {bool listen = true}) {
    return Provider.of<LocaleText>(context, listen: listen);
  }

  String get mainTitle => {
        'en': 'Virtual reality in readapt',
        'fr': 'La réalité virtuelle en réadaptation',
      }[language]!;
  String get descriptionAndGenerality => {
        'en': 'Description and generality',
        'fr': 'Description et généralité',
      }[language]!;
  String get consoles => {
        'en': 'Consoles',
        'fr': 'Consoles',
      }[language]!;
  String get forum => {
        'en': 'Forum',
        'fr': 'Forum',
      }[language]!;
  String get ressources => {
        'en': 'Ressources',
        'fr': 'Ressources',
      }[language]!;
}
