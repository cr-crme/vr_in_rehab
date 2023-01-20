import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String get tab => '    ';

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
        'en': '$tab- Lorem ipsum dolor sit amet, consectetur\n'
            '$tab- adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab- ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab- ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab- id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab- ipsum et ultrices accumsan, quam dolor gravida felis\n',
        'fr': '$tab- Lorem ipsum dolor sit amet, consectetur\n'
            '$tab- adipiscing elit. Phasellus augue nisi, scelerisque\n'
            '$tab- ut dictum vitae, pulvinar ac ex. Curabitur iaculi\n'
            '$tab- ut magna at tincidunt. Suspendisse erat sem, vestibulum\n'
            '$tab- id eleifend non, auctor imperdiet nisl. Morbi fringilla\n'
            '$tab- ipsum et ultrices accumsan, quam dolor gravida felis\n',
      }[language]!;
}
