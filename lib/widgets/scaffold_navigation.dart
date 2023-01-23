import 'package:flutter/material.dart';

class ScaffoldNavigation extends StatelessWidget {
  const ScaffoldNavigation({
    super.key,
    required this.mainTitle,
    required this.subTitle,
    required this.child,
  });

  final String mainTitle;
  final String subTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    mainTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
