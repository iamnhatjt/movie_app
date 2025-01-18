import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WatchMovie extends StatefulWidget {
  final String uriVideo;
  const WatchMovie({super.key, required this.uriVideo});

  @override
  State<WatchMovie> createState() => _WatchMovieState();
}

class _WatchMovieState extends State<WatchMovie> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  void dispose() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          android: AndroidInAppWebViewOptions(),
        ),
        initialUrlRequest: URLRequest(url: Uri.parse(widget.uriVideo)),
      ),
    );
  }
}
