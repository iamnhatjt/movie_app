import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/image_cache.dart';
import 'package:movie_app/core/presentation/loading.dart';
import 'package:movie_app/core/routers/routers.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/features/main_page/presentation/cubit/list_moive/list_movie_cubit.dart';

class MoreFilm extends StatelessWidget {
  const MoreFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ListMovieCubit()..getListMovie(page: Random().nextInt(200) + 300),
      child: BlocBuilder<ListMovieCubit, ListMovieState>(
        builder: (context, state) {
          if (state is ListMovieLoaded && !state.result.status!) {
            return const Text('got error');
          }
          if (state is ListMovieLoading) {
            return const LoadingWidget();
          }
          late final listMovie = context.read<ListMovieCubit>().listMovie();
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listMovie.items!
                  .map((e) => GestureDetector(
                        onTap: () {
                          context.push(RouterDerection.detail(e.slug ?? ''));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: ImageCacheWidget(
                                      url:
                                          '${listMovie.pathImage}${e.posterUrl}',
                                      height: 100,
                                      width: 100,
                                      boxFit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  e.name ?? '',
                                  style: JtStyle.smallTextBold
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
