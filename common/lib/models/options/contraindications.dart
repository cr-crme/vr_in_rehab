import '../locale_text.dart';
import 'option.dart';

class Contraindications extends Option {
  static const optionName = 'contra';

  const Contraindications.from({choice = -1})
      : super(optionName, choice: choice);

  static List<Contraindications> get values => [
        Contraindications.epilepsy,
        Contraindications.colorBlind,
        Contraindications.noContraindication,
      ];
  static Contraindications get epilepsy =>
      const Contraindications.from(choice: 0);
  static Contraindications get colorBlind =>
      const Contraindications.from(choice: 1);
  static Contraindications get noContraindication =>
      const Contraindications.from(choice: 2);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).epilepsy;
      case 1:
        return LocaleText.of(context, listen: listen).colorBlind;
      case 2:
        return LocaleText.of(context, listen: listen).noContraindication;
      default:
        return "Error";
    }
  }
}
