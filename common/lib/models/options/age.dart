import '../locale_text.dart';
import 'option.dart';

class Age extends Option {
  const Age.from({choice = -1}) : super(choice: choice);

  static List<Age> get values => [
        Age.young,
        Age.old,
        Age.all,
      ];
  static Age get young => const Age.from(choice: 0);
  static Age get old => const Age.from(choice: 1);
  static Age get all => const Age.from(choice: 2);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).young;
      case 1:
        return LocaleText.of(context, listen: listen).old;
      case 2:
        return LocaleText.of(context, listen: listen).all;
      default:
        return "Error";
    }
  }
}
