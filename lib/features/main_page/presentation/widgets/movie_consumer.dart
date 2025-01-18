import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/image_cache.dart';
import 'package:movie_app/core/presentation/round_button.dart';
import 'package:movie_app/core/routers/routers.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/features/main_page/domain/entities/movie.dart';

class MovieConsumer extends StatelessWidget {
  final MoviesModel movie;
  final String pathImage;
  const MovieConsumer(
      {super.key, required this.movie, required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white30,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ImageCacheWidget(
                height: 150,
                width: 100,
                boxFit: BoxFit.cover,
                url: '$pathImage${movie.posterUrl}',
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 3,
                  child: Text(
                    movie.name.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: JtStyle.mediumTextBold.copyWith(color: Colors.white),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 3,
                  child: Text(
                    movie.originName.toString(),
                    style:
                        JtStyle.mediumTextMedium.copyWith(color: Colors.white),
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                Text(movie.year.toString(),
                    style: JtStyle.mediumText.copyWith(color: Colors.white)),
                const Spacer(
                  flex: 4,
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                RoundedButton(
                    ontap: () {
                      context.go(RouterDerection.detail(movie.slug ?? ''));
                    },
                    color: Colors.redAccent,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text('Xem phim',
                        style: JtStyle.button.copyWith(color: Colors.white)))
              ],
            )
          ],
        ));
  }
}
