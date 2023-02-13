import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TextWithTitle extends StatelessWidget {
  const TextWithTitle(
    this.title,
    this.text, {
    Key? key,
    this.titleStyle,
    this.textStyle,
  }) : super(key: key);

  final String title;
  final String text;
  final TextStyle? titleStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    var textToPrint = text;
    if (textToPrint.contains('\n')) {
      textToPrint = textToPrint.replaceAll('\n', '\n\t${LocaleText.bullet} ');
      textToPrint = '\n\t${LocaleText.bullet} $textToPrint';
    }

    return RichText(
      text: TextSpan(children: [
        TextSpan(text: '$title : ', style: titleStyle ?? textStyle),
        TextSpan(text: textToPrint, style: textStyle)
      ]),
    );
  }
}
