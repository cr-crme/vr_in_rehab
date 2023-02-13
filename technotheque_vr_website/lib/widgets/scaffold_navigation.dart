import 'package:flutter/material.dart';

class ScaffoldNavigation extends StatelessWidget {
  const ScaffoldNavigation({
    super.key,
    required this.mainTitle,
    this.subTitle,
    required this.child,
    this.withBackButton = false,
  });

  final String mainTitle;
  final String? subTitle;
  final Widget child;
  final bool withBackButton;

  void _clickedBack(BuildContext context) {
    Navigator.of(context).pop();
  }

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
                  Row(
                    children: [
                      if (withBackButton)
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  color: Colors.white,
                                  onPressed: () => _clickedBack(context)),
                            ],
                          ),
                        ),
                      Expanded(
                        child: Text(
                          mainTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
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
            child,
          ],
        ),
      ),
    );
  }
}
