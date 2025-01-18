import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/round_button.dart';
import 'package:movie_app/core/routers/routers.dart';

class AppScaffold extends StatelessWidget {
  final bool? extendBody;
  final AppBar? appbar;
  final bool? isShowBackButton;
  final Widget body;
  final String? backDerection;
  const AppScaffold(
      {super.key,
      this.extendBody,
      required this.body,
      this.appbar,
      this.isShowBackButton,
      this.backDerection});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black87,
              extendBodyBehindAppBar: true,
              appBar: appbar,
              extendBody: extendBody ?? true,
              body: body,
            ),
            Visibility(
              visible: isShowBackButton ?? true,
              child: Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      context.go(backDerection ?? RouterDerection.home);
                    },
                    child: const RoundedButton(
                      height: 36,
                      width: 36,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  )),
            )
          ],
        ),
        onWillPop: () async => false);
  }
}
