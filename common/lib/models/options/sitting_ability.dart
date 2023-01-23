import '../locale_text.dart';
import 'option.dart';

class SittingAbility extends Option {
  const SittingAbility.from({choice = -1}) : super(choice: choice);

  static List<SittingAbility> get values => [
        SittingAbility.dynamicWithSupport,
        SittingAbility.dynamicNoSupport,
        SittingAbility.staticWithSupport,
        SittingAbility.staticNoSupport,
        SittingAbility.all,
      ];
  static SittingAbility get dynamicWithSupport =>
      const SittingAbility.from(choice: 0);
  static SittingAbility get dynamicNoSupport =>
      const SittingAbility.from(choice: 1);
  static SittingAbility get staticWithSupport =>
      const SittingAbility.from(choice: 2);
  static SittingAbility get staticNoSupport =>
      const SittingAbility.from(choice: 3);
  static SittingAbility get all => const SittingAbility.from(choice: 4);

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
