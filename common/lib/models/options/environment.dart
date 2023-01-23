import '../locale_text.dart';
import 'option.dart';

class Environment extends Option {
  const Environment.from({choice = -1}) : super(choice: choice);

  static List<Environment> get values => [
        Environment.clinic,
        Environment.homeWithTherapist,
        Environment.home,
        Environment.all,
      ];
  static Environment get clinic => const Environment.from(choice: 0);
  static Environment get homeWithTherapist => const Environment.from(choice: 1);
  static Environment get home => const Environment.from(choice: 2);
  static Environment get all => const Environment.from(choice: 3);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).clinic;
      case 1:
        return LocaleText.of(context, listen: listen).homeWithTherapist;
      case 2:
        return LocaleText.of(context, listen: listen).home;
      case 3:
        return LocaleText.of(context, listen: listen).all;
      default:
        return "error";
    }
  }
}
