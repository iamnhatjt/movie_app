import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/round_button.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void showYoutobe(context, String url) {
  showDialog(
    context: context,
    builder: (context) => YouToBeEmBed(url: url),
  );
}

class YouToBeEmBed extends StatefulWidget {
  final String url;
  const YouToBeEmBed({super.key, required this.url});

  @override
  State<YouToBeEmBed> createState() => _YouToBeEmBedState();
}

class _YouToBeEmBedState extends State<YouToBeEmBed> {
  late YoutubePlayerController _controller;
  late final urlCovert = YoutubePlayer.convertUrlToId(widget.url)!;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: urlCovert,
      flags: const YoutubePlayerFlags(
        hideThumbnail: false,
        forceHD: true,
        showLiveFullscreenButton: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        actions: [
          RoundedButton(
              ontap: context.pop,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Colors.redAccent.withOpacity(0.6),
              child: Text(
                'Back',
                style: JtStyle.button.copyWith(color: Colors.white),
              ))
        ],
        contentPadding: EdgeInsets.zero,
        content: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          onReady: () {},
        ),
      ),
    );
  }
}
