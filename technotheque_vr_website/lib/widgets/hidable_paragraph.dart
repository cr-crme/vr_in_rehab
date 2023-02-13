import 'package:flutter/material.dart';

class HidableParagraph extends StatefulWidget {
  const HidableParagraph({
    super.key,
    required this.title,
    required this.paragraph,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textToExpand,
    this.textToReduce,
  });

  final Widget title;
  final Widget paragraph;
  final String? textToExpand;
  final String? textToReduce;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  State<HidableParagraph> createState() => _HidableParagraphState();
}

class _HidableParagraphState extends State<HidableParagraph>
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

  Widget _buildClickable(Widget child) {
    return GestureDetector(
        onTap: _clickExpand,
        child: MouseRegion(cursor: SystemMouseCursors.click, child: child));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: widget.crossAxisAlignment,
        children: [
          _buildClickable(widget.title),
          if (widget.textToExpand != null && !_isExpanded)
            _buildClickable(
              Text(
                widget.textToExpand!,
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          SizeTransition(sizeFactor: _expandAnimation, child: widget.paragraph),
          if (widget.textToReduce != null && _isExpanded)
            _buildClickable(
              Text(
                widget.textToReduce!,
                style: const TextStyle(decoration: TextDecoration.underline),
              ),
            ),
        ],
      ),
    );
  }
}
