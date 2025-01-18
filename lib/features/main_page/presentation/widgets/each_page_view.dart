import 'package:flutter/material.dart';
import 'package:movie_app/core/presentation/image_cache.dart';
import 'package:movie_app/core/presentation/round_button.dart';
import 'package:movie_app/core/themes/color.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/features/main_page/domain/entities/movie.dart';

class EachPageView extends StatelessWidget {
  final VoidCallback? ontap;
  final MoviesModel e;
  final String parthImage;
  const EachPageView(
      {super.key, required this.e, required this.parthImage, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageCacheWidget(url: '$parthImage${e.posterUrl}'),
        Container(
          decoration: const BoxDecoration(color: Colors.black26),
        ),
        Positioned(
            bottom: 200,
            left: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Text(
                    e.name!,
                    style: JtStyle.pageTitleBold.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${e.originName!} - ${e.year}',
                  style: JtStyle.smallText.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: ontap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ImageCacheWidget(
                          url: '$parthImage${e.thumbUrl}',
                          boxFit: BoxFit.contain),
                    ),
                  ),
                )
              ],
            )),
        Positioned(
            bottom: 200,
            right: 20,
            child: RoundedButton(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              radius: 4,
              ontap: ontap,
              color: JtColor.red,
              child: Text('Xem phim',
                  style: JtStyle.smallTextBold.copyWith(color: Colors.white)),
            )),
      ],
    );
  }
}
