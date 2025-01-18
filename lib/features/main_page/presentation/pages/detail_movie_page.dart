import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/presentation/app_scaffold.dart';
import 'package:movie_app/core/presentation/image_cache.dart';
import 'package:movie_app/core/presentation/loading.dart';
import 'package:movie_app/core/presentation/round_button.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/core/widgets/showSnackBar/show_snackbar.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/detail_movie_response.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/server_data.dart';
import 'package:movie_app/features/main_page/presentation/cubit/detail_movie/detail_movie_cubit.dart';
import 'package:movie_app/features/main_page/presentation/pages/watching_page.dart';
import 'package:movie_app/features/main_page/presentation/widgets/more_flim.dart';
import 'package:movie_app/features/main_page/presentation/widgets/youtube_embed_popup.dart';

class DetailMoviePage extends StatelessWidget {
  final String slug;
  const DetailMoviePage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailMovieCubit()..getDetailMovie(slug),
      child: BlocConsumer<DetailMovieCubit, DetailMovieState>(
        listener: (context, state) {
          if (state is DetailMovieError) {
            context.showSnackBarFail(text: state.error);
          }
          if (state is DetailMovieLoaded) {
            if (!context.read<DetailMovieCubit>().detailMovie().status!) {
              context.showSnackBarFail(
                  text:
                      context.read<DetailMovieCubit>().detailMovie().msg ?? '');
            }
          }
        },
        builder: (context, state) {
          if (state is DetailMovieLoading) {
            return const LoadingWidget();
          }
          if (state is DetailMovieError) {
            return const AppScaffold(body: Text('got error'));
          }

          late final detailMovieCubit =
              context.read<DetailMovieCubit>().detailMovie();
          return AppScaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ImageCacheWidget(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    url: detailMovieCubit.movie?.poster_url ?? '',
                    boxFit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  headerMovie(detailMovieCubit, context),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: ExpandableText(
                      detailMovieCubit.movie?.content
                              ?.replaceAll('<p>', '')
                              .replaceAll('</p>', '') ??
                          '',
                      expandText: 'Show more',
                      collapseText: 'Show less',
                      linkStyle:
                          JtStyle.mediumText.copyWith(color: Colors.white70),
                      animation: true,
                      animationDuration: const Duration(milliseconds: 300),
                      animationCurve: Curves.easeIn,
                      style: JtStyle.mediumTextBold
                          .copyWith(color: Colors.white.withOpacity(0.8)),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'EPISODE',
                        style: JtStyle.mediumTextBold
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  if (detailMovieCubit.episodes!.isNotEmpty &&
                      detailMovieCubit.episodes!.first.server_data!.length > 1)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: detailMovieCubit.episodes![0].server_data!
                          .map((e) => Episode(
                                e: e,
                              ))
                          .toList(),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'MORE FILM',
                        style: JtStyle.mediumTextBold
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const MoreFilm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row headerMovie(DetailMovieResponse detailMovieCubit, context) {
    return Row(
      children: [
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageCacheWidget(
                  url: detailMovieCubit.movie?.thumb_url ?? '',
                  height: 200,
                  boxFit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if ((detailMovieCubit.movie?.trailer_url?.trim() ?? '')
                      .isNotEmpty)
                    RoundedButton(
                        ontap: () {
                          showYoutobe(
                              context, detailMovieCubit.movie!.trailer_url!);
                        },
                        radius: 8,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        color: Colors.redAccent.withOpacity(0.8),
                        child: Text(
                          'Trailer',
                          style: JtStyle.button.copyWith(color: Colors.white),
                        )),
                  if ((detailMovieCubit.episodes?.first.server_data?.length ==
                      1))
                    RoundedButton(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WatchMovie(
                                    uriVideo: detailMovieCubit.episodes?.first
                                            .server_data?.first.link_embed ??
                                        ''),
                              ));
                        },
                        radius: 8,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        color: Colors.redAccent.withOpacity(0.8),
                        child: Text(
                          'Xem phim',
                          style: JtStyle.button.copyWith(color: Colors.white),
                        ))
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                detailMovieCubit.movie?.name ?? '',
                style: JtStyle.pageTitleBold.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Director: ',
                    style: JtStyle.mediumText
                        .copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: detailMovieCubit.movie!.director!
                        .map(
                          (e) => Text(
                            e == '' ? 'Chưa xác đinh' : e.toString(),
                            style: JtStyle.mediumText
                                .copyWith(color: Colors.white.withOpacity(0.8)),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Năm sản xuất: ',
                    style: JtStyle.mediumText
                        .copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                  Text(
                    detailMovieCubit.movie?.year.toString() ?? '',
                    style: JtStyle.mediumText
                        .copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    'Quốc gia: ',
                    style: JtStyle.mediumText
                        .copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: detailMovieCubit.movie!.country!
                        .map(
                          (e) => Text(
                            '${e.name.toString()} ',
                            style: JtStyle.mediumText
                                .copyWith(color: Colors.white.withOpacity(0.8)),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diễn viên: ',
                    style: JtStyle.mediumText
                        .copyWith(color: Colors.white.withOpacity(0.8)),
                  ),
                  Expanded(
                    child: Wrap(
                      children: detailMovieCubit.movie!.actor!
                          .map(
                            (e) => Text(
                              e == '' ? 'Chưa xác đinh' : e.toString(),
                              style: JtStyle.mediumText.copyWith(
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: [
                  RoundedButton(
                      radius: 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        detailMovieCubit.movie?.quality ?? '',
                        style: JtStyle.smallTextBold
                            .copyWith(color: Colors.white.withOpacity(0.8)),
                      )),
                  RoundedButton(
                      radius: 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        detailMovieCubit.movie?.lang ?? '',
                        style: JtStyle.smallTextBold
                            .copyWith(color: Colors.white.withOpacity(0.8)),
                      )),
                  RoundedButton(
                      radius: 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        detailMovieCubit.movie?.time ?? '',
                        style: JtStyle.smallTextBold
                            .copyWith(color: Colors.white.withOpacity(0.8)),
                      )),
                  RoundedButton(
                      radius: 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        detailMovieCubit.movie?.type ?? '',
                        style: JtStyle.smallTextBold
                            .copyWith(color: Colors.white.withOpacity(0.8)),
                      )),
                  RoundedButton(
                      radius: 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        detailMovieCubit.movie?.status ?? '',
                        style: JtStyle.smallTextBold
                            .copyWith(color: Colors.white.withOpacity(0.8)),
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Episode extends StatelessWidget {
  final ServerData e;
  const Episode({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          child: Text(
            e.filename ?? '',
            softWrap: true,
            style: JtStyle.smallText.copyWith(color: Colors.white),
          ),
        ),
        RoundedButton(
            ontap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WatchMovie(uriVideo: e.link_embed ?? e.link_m3u8 ?? ''),
                  ));
            },
            color: Colors.redAccent.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              'Xem phim',
              style:
                  JtStyle.button.copyWith(color: Colors.white.withOpacity(0.8)),
            ))
      ]),
    );
  }
}
