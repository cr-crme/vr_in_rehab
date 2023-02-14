import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '/common/widgets/vr_app_bar.dart';

class ResultGameDetailsScreen extends StatefulWidget {
  const ResultGameDetailsScreen({
    super.key,
    required this.game,
  });

  static const route = '/result-game-details-screen';

  final Game game;

  @override
  State<ResultGameDetailsScreen> createState() =>
      _ResultGameDetailsScreenState();
}

class _ResultGameDetailsScreenState extends State<ResultGameDetailsScreen>
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
    final texts = LocaleText.of(context);
    final textStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white);
    final titleStyle = textStyle.copyWith(
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 123, 255, 213));

    final textToExpand = [
      [texts.time, widget.game.time(context)],
      [texts.position, widget.game.position(context)],
      [texts.numberPlayers, widget.game.numberPlayers(context)],
      [texts.progression, widget.game.progression(context)],
      [texts.performanceFeedback, widget.game.performanceFeedback(context)],
      [texts.resultsFeedback, widget.game.resultsFeedback(context)],
      [texts.physicalRequirements, widget.game.physicalRequirements(context)],
      [texts.motorSkills, widget.game.motorSkills(context)],
      [texts.sideNotes, widget.game.sideNotes(context)],
      [texts.cognitiveRequirements, widget.game.cognitiveRequirements(context)],
    ];

    return Scaffold(
      appBar: VrAppBar(
          title: Text(
              '${widget.game.title}${widget.game.collection != '' ? ' from ${widget.game.collection}' : ''}')),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: _clickExpand,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: widget.game.thumbnailPath != null
                            ? Image.network(
                                widget.game.thumbnailPath!,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(),
                              )
                            : null),
                  ),
                  TextWithTitle(
                    texts.description,
                    widget.game.description(context),
                    textStyle: textStyle,
                    titleStyle: titleStyle,
                  ),
                  SizeTransition(
                    sizeFactor: _expandAnimation,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: textToExpand
                            .map<Widget>((element) => TextWithTitle(
                                  element[0],
                                  element[1],
                                  textStyle: textStyle,
                                  titleStyle: titleStyle,
                                ))
                            .toList()),
                  ),
                  Text(
                    _isExpanded ? texts.lessInformation : texts.moreInformation,
                    style: textStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
