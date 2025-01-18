import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBarSuccess({required String text}) {
    final snackBar = SnackBar(
      content: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.done_outline_outlined,
              size: 30,
              color: Colors.greenAccent,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showSnackBarFail({required String text}) {
    final snackBar = SnackBar(
      content: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.close_rounded,
              size: 30,
              color: Colors.red,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.red.shade300,
      duration: const Duration(seconds: 3),
      shape: const StadiumBorder(),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
