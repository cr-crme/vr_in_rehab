import '../locale_text.dart';
import 'option.dart';

class StandingAbility extends Option {
  const StandingAbility.from({choice = -1}) : super(choice: choice);

  static List<StandingAbility> get values => [
        StandingAbility.dynamicWithSupport,
        StandingAbility.dynamicNoSupport,
        StandingAbility.staticWithSupport,
        StandingAbility.staticNoSupport,
        StandingAbility.all,
      ];
  static StandingAbility get dynamicWithSupport =>
      const StandingAbility.from(choice: 0);
  static StandingAbility get dynamicNoSupport =>
      const StandingAbility.from(choice: 1);
  static StandingAbility get staticWithSupport =>
      const StandingAbility.from(choice: 2);
  static StandingAbility get staticNoSupport =>
      const StandingAbility.from(choice: 3);
  static StandingAbility get all => const StandingAbility.from(choice: 4);

  @override
  String title(context, {listen = true}) {
    switch (choice) {
      case 0:
        return LocaleText.of(context, listen: listen).dynamicWithSupport;
      case 1:
        return LocaleText.of(context, listen: listen).dynamicNoSupport;
      case 2:
        return LocaleText.of(context, listen: listen).staticWithSupport;
      case 3:
        return LocaleText.of(context, listen: listen).staticNoSupport;
      case 4:
        return LocaleText.of(context, listen: listen).all;
      default:
        return 'Error';
    }
  }
}
