import 'locale_text.dart';

class Console {
  Console.from({this.choice = -1});

  int serialize() => choice;
  final int choice;
  static Console get bootleBlast => Console.from(choice: 0);
  static Console get jintronix => Console.from(choice: 1);
  static Console get habilup => Console.from(choice: 2);
  static Console get xbox => Console.from(choice: 3);
  static Console get nintendoSwitch => Console.from(choice: 4);
  static Console get oculus => Console.from(choice: 5);
  static Console get vive => Console.from(choice: 6);

  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).bootleBlast;
      case 1:
        return LocaleText.of(context, listen: listen).jintronix;
      case 2:
        return LocaleText.of(context, listen: listen).habilup;
      case 3:
        return LocaleText.of(context, listen: listen).xbox;
      case 4:
        return LocaleText.of(context, listen: listen).nintendoSwitch;
      case 5:
        return LocaleText.of(context, listen: listen).oculus;
      case 6:
        return LocaleText.of(context, listen: listen).vive;
      default:
        return "Error";
    }
  }
}
