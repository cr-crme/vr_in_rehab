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
    final mainText = separateText(text);
    final hasBullet = mainText.length > 1;

    return hasBullet
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$title : ', style: titleStyle ?? textStyle),
              ...mainText.map<Widget>(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('${LocaleText.bullet} '),
                      Expanded(child: Text(e, style: textStyle)),
                    ],
                  ),
                ),
              ),
            ],
          )
        : RichText(
            text: TextSpan(children: [
              TextSpan(text: '$title : ', style: titleStyle ?? textStyle),
              TextSpan(text: mainText[0], style: textStyle)
            ]),
          );
  }
}
