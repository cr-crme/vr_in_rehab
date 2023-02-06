import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
    this.title, {
    super.key,
    this.width = 200,
    this.cornerRadius = 20,
    this.onPressed,
  });

  final String title;
  final double width;
  final double cornerRadius;
  final VoidCallback? onPressed;

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
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: onPressed != null ? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
