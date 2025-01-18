import 'package:flutter/material.dart';

import '../../../../core/themes/color.dart';
import '../../../../core/themes/typography.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.flutter_dash,
              color: JtColor.indigo,
              size: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Movie App',
              style: JtStyle.bigText.copyWith(color: JtColor.cyan),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Welcome to MovieApp',
          style: JtStyle.pageTitleBold,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Sign up or login bellow to manage your \n movie, task and life',
          style: JtStyle.bodyText.copyWith(
            color: Colors.grey.shade800,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
