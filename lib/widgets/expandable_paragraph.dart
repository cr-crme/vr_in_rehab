import 'package:flutter/material.dart';

class ExpandableParagraph extends StatefulWidget {
  const ExpandableParagraph(
      {super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  State<ExpandableParagraph> createState() => _ExpandableParagraphState();
}

class _ExpandableParagraphState extends State<ExpandableParagraph>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _prepareExpandAnimation();
    _selectExpandDirection();
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _clickExpand() {
    _isExpanded = !_isExpanded;
    _selectExpandDirection();
    setState(() {});
  }

  ///Setting up the animation
  void _prepareExpandAnimation() {
    _expandController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeInOut,
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: _clickExpand,
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(widget.title,
                      style: Theme.of(context).textTheme.titleMedium))),
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: SelectableText(
              widget.text,
            ),
          ),
        ],
      ),
    );
  }
}
