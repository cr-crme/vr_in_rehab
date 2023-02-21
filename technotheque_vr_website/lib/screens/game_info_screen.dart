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
  late final VideoPlayerController? _controller = widget.videoPath != null
      ? VideoPlayerController.network(widget.videoPath!)
      : null;

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
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

    // If we get here, _controller was successfully initialized
    return FutureBuilder(
        future: _controller!.initialize(),
        builder: (context, snapshot) {
          return Column(
            children: [
              _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: 16.0 / 9.0, child: VideoPlayer(_controller!))
                  : Image.network(
                      widget.imagePath!,
                      errorBuilder: (context, error, stackTrace) => Container(),
                    ),
              if (_controller!.value.isInitialized)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _controller!.value.isPlaying
                      ? ElevatedButton(
                          onPressed: () async {
                            await _controller!.pause();
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: const Icon(Icons.pause))
                      : ElevatedButton(
                          onPressed: () async {
                            await _controller!.play();
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Icon(Icons.play_arrow)),
                )
            ],
          );
        });
  }
}
