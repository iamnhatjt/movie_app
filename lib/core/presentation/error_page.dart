import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/gen/assets.gen.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback? reload;
  const ErrorPage({super.key, this.reload});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.red.withOpacity(0.8),
        Colors.redAccent.shade400,
      ])),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Assets.images.error.image(),
          const Text('Some thing when Wrong!', style: JtStyle.pageTitleMedium),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: reload,
              child: Text(
                'Reload...',
                style: JtStyle.button.copyWith(color: Colors.white),
              )),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
