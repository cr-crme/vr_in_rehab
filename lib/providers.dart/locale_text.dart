import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocaleText with ChangeNotifier {
  LocaleText({required this.language});

  static const String tab = '    ';
  static const String bullet = '\u2022';

  void setLanguage(language) {
    this.language = language;
    notifyListeners();
  }

  String language;

  static LocaleText of(BuildContext context, {bool listen = true}) {
    return Provider.of<LocaleText>(context, listen: listen);
  }

  String get colon => {
        'en': ':',
        'fr': ' :',
      }[language]!;

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

  String get whatIsVrTitle => {
        'en': 'What is virtual reality (VR)?',
        'fr': 'Qu\'est-ce que la réalité virtuelle (RV)',
      }[language]!;
  String get whatIsVrText => {
        'en':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vehicula ante nec ante vehicula, vel facilisis tellus varius. Quisque fermentum orci in lorem feugiat laoreet. Pellentesque id urna ultrices, mollis nibh sed, malesuada tortor. Curabitur elit libero, mollis ornare luctus non, ultricies eget odio. Sed posuere nunc mi, vel auctor tellus dapibus vel. Vestibulum sed efficitur diam, id volutpat nisi. Ut placerat, sapien eget aliquam tempor, orci sapien efficitur elit, sit amet fermentum massa ante ac sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas vitae eros sagittis enim dignissim scelerisque. Integer pulvinar nulla id turpis vestibulum suscipit. Sed ac ligula at odio aliquam pulvinar. Nulla vel lacus tellus. Pellentesque at lectus non lectus lacinia pretium in ac est.',
        'fr':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vehicula ante nec ante vehicula, vel facilisis tellus varius. Quisque fermentum orci in lorem feugiat laoreet. Pellentesque id urna ultrices, mollis nibh sed, malesuada tortor. Curabitur elit libero, mollis ornare luctus non, ultricies eget odio. Sed posuere nunc mi, vel auctor tellus dapibus vel. Vestibulum sed efficitur diam, id volutpat nisi. Ut placerat, sapien eget aliquam tempor, orci sapien efficitur elit, sit amet fermentum massa ante ac sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas vitae eros sagittis enim dignissim scelerisque. Integer pulvinar nulla id turpis vestibulum suscipit. Sed ac ligula at odio aliquam pulvinar. Nulla vel lacus tellus. Pellentesque at lectus non lectus lacinia pretium in ac est.',
      }[language]!;

  String get immersiveVsNonImmersiveTitle => {
        'en': 'Immersive VS non-immersive virtual reality?',
        'fr': 'Immersive VS non-immersive réalité virtuelle?',
      }[language]!;
  String get immersiveVsNonImmersiveText => {
        'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
        'fr': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
      }[language]!;

  String get prosOfVrTitle => {
        'en': 'Pros of virtual reality in pediatric rehab',
        'fr': 'Avantages de la réalité virtuelle en réadaptation pédiatrique',
      }[language]!;
  String get prosOfVrText => {
        'en': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
        'fr': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
      }[language]!;

  String get contraindicationVrTitle => {
        'en': 'Contraindications and precautions',
        'fr': 'Contre-indications et précautions',
      }[language]!;
  String get contraindicationVrText => {
        'en': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
        'fr': '$tab$bullet Lorem ipsum dolor sit amet, consectetur\n'
            '$tab$bullet adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab$bullet ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab$bullet ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab$bullet id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab$bullet ipsum et ultrices accumsan, quam dolor gravida felis\n',
      }[language]!;

  String get websiteNavigationTitle => {
        'en': 'Navigating this website',
        'fr': 'Fonctionne du site internet',
      }[language]!;
  String get websiteNavigationText => {
        'en': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
        'fr': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus augue nisi, scelerisque ut dictum vitae, pulvinar ac ex. Curabitur iaculis ut magna at tincidunt. Suspendisse erat sem, vestibulum id eleifend non, auctor imperdiet nisl. Morbi fringilla, ipsum et ultrices accumsan, quam dolor gravida felis, vel elementum lectus lectus ac nunc. Aliquam mauris eros, sollicitudin at egestas ac, fringilla auctor turpis. Nunc accumsan ultrices nisl aliquam fringilla. Sed vel nunc vel augue sagittis mollis. Suspendisse pretium, massa sed scelerisque condimentum, ante nisi elementum turpis, in pharetra magna erat sed augue. Proin dictum sem in risus tempor venenatis.\n'
            'Quisque fringilla consectetur ligula ut malesuada. Duis sagittis elit eget nunc vulputate elementum. Proin venenatis hendrerit velit, nec laoreet purus blandit non. Etiam vulputate est elit, sed hendrerit justo congue tempor. Nunc lobortis tempus risus ut sagittis. Vivamus ac placerat libero, nec dignissim tellus. Fusce vel sapien mollis, scelerisque nunc sit amet, cursus quam. Morbi faucibus sodales orci quis consequat. Nullam tempus vel urna vel varius. Maecenas purus elit, placerat iaculis convallis quis, placerat eget ante. Proin sit amet rutrum nulla. Vestibulum rutrum rhoncus dui nec luctus. Vivamus pellentesque sodales ante sit amet vulputate. Sed euismod mattis odio. Nam tellus arcu, iaculis in dapibus id, pharetra non risus.',
      }[language]!;

  String get consoleClickHereForGames => {
        'en': 'Click here to see the games for this console',
        'fr': 'Cliquer ici pour voir les jeux sur cette console',
      }[language]!;
  String get consoleImmersiveTitle => {
        'en': 'Immersive / non-immersive',
        'fr': 'Immersive / non-immersive',
      }[language]!;
  String get consoleTargetTitle => {
        'en': 'Created for the readaptation or for the general public',
        'fr': 'Créée pour la réadaptation ou pour le grand public',
      }[language]!;
  String get consoleRequiredSpaceTitle => {
        'en': 'Required space',
        'fr': 'Espace requis',
      }[language]!;
  String get consolePrecautionsTitle => {
        'en': 'Precautions',
        'fr': 'Précautions',
      }[language]!;
  String get consoleEquipmentsTitle => {
        'en': 'Equipments',
        'fr': 'Équipements',
      }[language]!;
  String get consoleCostsTitle => {
        'en': 'Costs',
        'fr': 'Coûts',
      }[language]!;

  String get consoleBootleBlastTitle => {
        'en': 'BootleBlast',
        'fr': 'BootleBlast',
      }[language]!;
  String get consoleBootleBlastImmersive => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleBootleBlastTarget => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleBootleBlastRequiredSpace => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleBootleBlastPrecautions => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleBootleBlastEquipments => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleBootleBlastCosts => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;

  String get consoleHabilupTitle => {
        'en': 'Habilup',
        'fr': 'Habilup',
      }[language]!;
  String get consoleHabilupImmersive => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleHabilupTarget => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleHabilupRequiredSpace => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleHabilupPrecautions => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleHabilupEquipments => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleHabilupCosts => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;

  String get consoleViveTitle => {
        'en': 'HTV Vive',
        'fr': 'HTV Vive',
      }[language]!;
  String get consoleViveImmersive => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleViveTarget => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleViveRequiredSpace => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleVivePrecautions => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleViveEquipments => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleViveCosts => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;

  String get consoleJintronixTitle => {
        'en': 'Jintronix',
        'fr': 'Jintronix',
      }[language]!;
  String get consoleJintronixImmersive => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleJintronixTarget => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleJintronixRequiredSpace => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleJintronixPrecautions => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleJintronixEquipments => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleJintronixCosts => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;

  String get consoleNintendoSwitchTitle => {
        'en': 'Nintendo Switch',
        'fr': 'Nintendo Switch',
      }[language]!;
  String get consoleNintendoSwitchImmersive => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleNintendoSwitchTarget => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleNintendoSwitchRequiredSpace => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleNintendoSwitchPrecautions => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleNintendoSwitchEquipments => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleNintendoSwitchCosts => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;

  String get consoleOculusTitle => {
        'en': 'Oculus',
        'fr': 'Oculus',
      }[language]!;
  String get consoleOculusImmersive => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleOculusTarget => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleOculusRequiredSpace => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleOculusPrecautions => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleOculusEquipments => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleOculusCosts => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;

  String get consoleXboxTitle => {
        'en': 'XBox 360',
        'fr': 'XBox 360',
      }[language]!;
  String get consoleXboxImmersive => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleXboxTarget => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleXboxRequiredSpace => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleXboxPrecautions => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleXboxEquipments => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
  String get consoleXboxCosts => {
        'en': 'Lorem ipsum dolor',
        'fr': 'Lorem ipsum dolor',
      }[language]!;
}
