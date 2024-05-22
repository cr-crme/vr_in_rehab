import 'package:common/common.dart';
import 'package:flutter/material.dart';

class VrAppBar extends AppBar {
  VrAppBar({
    super.key,
    super.title,
    actions,
  }) : super(actions: [
          if (actions != null) ...actions,
          // const _LanguageSwitcher(),
          // const SizedBox(width: 10),
        ]);
}

class _LanguageSwitcher extends StatefulWidget {
  const _LanguageSwitcher();

  @override
  State<_LanguageSwitcher> createState() => __LanguageSwitcherState();
}

class __LanguageSwitcherState extends State<_LanguageSwitcher> {
  late String _currentLanguage = 'fr';

  @override
  void initState() {
    super.initState();
    _currentLanguage = LocaleText.of(context, listen: false).language;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _currentLanguage = _currentLanguage == 'fr' ? 'en' : 'fr';
        LocaleText.of(context, listen: false).setLanguage(_currentLanguage);
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          _currentLanguage == 'fr' ? 'en' : 'fr',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
