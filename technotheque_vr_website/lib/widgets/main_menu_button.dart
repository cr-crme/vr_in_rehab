import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({super.key, required this.title, required this.route});

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(route),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
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
