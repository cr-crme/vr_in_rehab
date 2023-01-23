import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton(this.title,
      {super.key,
      this.width = 200,
      this.cornerRadius = 20,
      required this.clickCallback});

  final String title;
  final double width;
  final double cornerRadius;
  final Function(BuildContext) clickCallback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(width),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        side: const BorderSide(width: 1, color: Colors.white),
        elevation: 0,
      ),
      onPressed: () => clickCallback(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
