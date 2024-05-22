import 'package:common/common.dart';
import 'package:flutter/material.dart';

class WrongSizeException implements Exception {
  WrongSizeException(this.message);
  String message;
}

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher(
      {Key? key,
      required this.width,
      required this.height,
      this.color,
      this.backgroudColor})
      : super(key: key);

  final double width;
  final double height;
  final Color? color;
  final Color? backgroudColor;

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher>
    with TickerProviderStateMixin {
  bool _currentLanguage = true;

  @override
  void initState() {
    super.initState();

    if (widget.width / 2.7 < widget.height) {
      throw WrongSizeException('Some arbitrary error');
    }
  }

  late final AnimationController _slideController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textHeight = widget.height * 0.6;
    return GestureDetector(
      onTap: _clickedChangeLanguage,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: widget.backgroudColor ??
                    Theme.of(context).colorScheme.secondary),
            width: widget.width,
            height: widget.height,
          ),
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromLTRB(widget.width * 0.45, 0, 0, 0),
              end: RelativeRect.fromLTRB(0, 0, widget.width * 0.45, 0),
            ).animate(CurvedAnimation(
              parent: _slideController,
              curve: Curves.easeInOut,
            )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: widget.color ?? Theme.of(context).colorScheme.primary),
            ),
          ),
          Positioned(
            left: widget.width * 0.1,
            top: 0,
            child: Text(
              'en',
              style: TextStyle(
                fontSize: textHeight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            right: widget.width * 0.15,
            top: 0,
            child: Text(
              'fr',
              style: TextStyle(
                fontSize: textHeight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clickedChangeLanguage() {
    _currentLanguage = !_currentLanguage;
    LocaleText.of(context, listen: false)
        .setLanguage(_currentLanguage ? 'fr' : 'en');

    _currentLanguage ? _slideController.reverse() : _slideController.forward();
    setState(() {});
  }
}
