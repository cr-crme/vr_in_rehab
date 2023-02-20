import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '/widgets/game_info.dart';
import '/widgets/scaffold_navigation.dart';

class GameInfoScreen extends StatelessWidget {
  const GameInfoScreen({super.key});

  static const String route = '/game-info';

  @override
  Widget build(BuildContext context) {
    final texts = LocaleText.of(context);
    final game = ModalRoute.of(context)!.settings.arguments as Game;

    return ScaffoldNavigation(
      mainTitle: texts.websiteTitle,
      withBackButton: true,
      child: Flexible(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: GameInfo(game: game)),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: _GameInfoThumbnail(
                        videoPath: game.videoDemoPath,
                        imagePath: game.thumbnailPath,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GameInfoThumbnail extends StatefulWidget {
  const _GameInfoThumbnail({this.videoPath, this.imagePath});

  final String? videoPath;
  final String? imagePath;

  @override
  State<_GameInfoThumbnail> createState() => _GameInfoThumbnailState();
}

class _GameInfoThumbnailState extends State<_GameInfoThumbnail> {
  late final VideoPlayerController? _controller;
  late final Future<void>? _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = widget.videoPath != null
        ? VideoPlayerController.network(widget.videoPath!)
        : null;
    _initializeVideoPlayerFuture = _controller?.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  void _toggleVideoPlaying() {
    if (_controller!.value.isPlaying) {
      _controller!.pause();
    } else {
      _controller!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoPath == null && widget.imagePath == null) {
      return Container();
    }
    final imageWidget = Image.network(
      widget.imagePath!,
      errorBuilder: (context, error, stackTrace) => Container(),
    );
    if (widget.videoPath == null) {
      return imageWidget;
    }
    return imageWidget; // To remove when videos work

    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Stack(alignment: Alignment.center, children: [
            imageWidget,
            const Center(
                child: SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator())),
          ]);
        }

        return GestureDetector(
          onTap: _toggleVideoPlaying,
          child: VideoPlayer(_controller!),
        );
      },
    );
  }
}
