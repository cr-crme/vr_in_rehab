import 'package:flutter/material.dart';

class TextWithTitle extends StatelessWidget {
  const TextWithTitle(
    this.title,
    this.text, {
    Key? key,
    required this.titleStyle,
    required this.textStyle,
  }) : super(key: key);

  final String title;
  final String text;
  final TextStyle? titleStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: '$title : ', style: titleStyle ?? textStyle),
        TextSpan(text: text, style: textStyle)
      ]),
    );
  }
}
