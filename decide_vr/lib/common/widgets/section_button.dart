import 'package:auto_size_text/auto_size_text.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/common/providers/decision_algorithm.dart';

class SectionButton extends StatefulWidget {
  const SectionButton(
    this.title, {
    super.key,
    required this.options,
    this.width = 200,
    this.cornerRadius = 20,
    this.defaultOption = 0,
    this.padding,
  });

  final String title;
  final List<Option> options;
  final int defaultOption;

  final double width;
  final double cornerRadius;
  final EdgeInsets? padding;

  @override
  State<SectionButton> createState() => _SectionButtonState();
}

class _SectionButtonState extends State<SectionButton>
    with SingleTickerProviderStateMixin {
  late int _optionSelected;

  bool _isExpanded = false;
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _optionSelected = widget.defaultOption >= 0
        ? widget.defaultOption
        : widget.options.length + widget.defaultOption;
    _prepareExpandAnimation();
    _selectExpandDirection();
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  ///Setting up the animation
  void _prepareExpandAnimation() {
    _expandController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.decelerate,
    );
  }

  void _selectExpandDirection() {
    if (_isExpanded) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddingChild = Center(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(widget.cornerRadius)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ElevatedButton(
                onPressed: _clickExpand,
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(widget.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: AutoSizeText(
                    widget.title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ...widget.options
                .asMap()
                .entries
                .map((entry) => _optionWidget(entry.key, entry.value))
                .toList(),
          ],
        ),
      ),
    );
    return widget.padding != null
        ? Padding(
            padding: widget.padding!,
            child: paddingChild,
          )
        : paddingChild;
  }

  void _clickExpand() {
    _isExpanded = !_isExpanded;
    _selectExpandDirection();
    setState(() {});
  }

  void _selectOption(int index, Option option) {
    _optionSelected = index;
    DecisionAlgorithm.of(context, listen: false).option = option;
    setState(() {});
  }

  Widget _optionWidget(int index, Option option) {
    return SizedBox(
      width: widget.width,
      child: SizeTransition(
        sizeFactor: _expandAnimation,
        child: Center(
          child: GestureDetector(
            onTap: () => _selectOption(index, option),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: AutoSizeText(
                option.title(context),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: _optionSelected == index
                        ? Theme.of(context).colorScheme.onSecondary
                        : Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
