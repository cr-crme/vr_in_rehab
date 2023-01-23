import 'package:flutter/material.dart';

class ScaffoldNavigation extends StatelessWidget {
  const ScaffoldNavigation({
    super.key,
    required this.mainTitle,
    this.subTitle,
    required this.child,
  });

  final String mainTitle;
  final String? subTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    mainTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                ],
              ),
            ),
            Flexible(child: SingleChildScrollView(child: child)),
          ],
        ),
      ),
    );
  }
}
