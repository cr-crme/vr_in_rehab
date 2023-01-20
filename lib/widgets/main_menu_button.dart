import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: ElevatedButton(
        onPressed: () {},
        child: SizedBox(
          width: 250,
          height: 60,
          child: Center(
              child: Text(
            title,
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}
