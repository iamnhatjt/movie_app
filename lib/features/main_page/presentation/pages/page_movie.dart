import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/presentation/app_scaffold.dart';
import 'package:movie_app/core/presentation/error_page.dart';
import 'package:movie_app/core/presentation/loading.dart';
import 'package:movie_app/core/themes/color.dart';
import 'package:movie_app/core/themes/typography.dart';
import 'package:movie_app/features/main_page/presentation/cubit/page_movie/page_movie_cubit.dart';
import 'package:movie_app/features/main_page/presentation/widgets/movie_consumer.dart';
import 'package:movie_app/gen/assets.gen.dart';

class PageMovieScreen extends StatelessWidget {
  const PageMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      extendBody: true,
      isShowBackButton: false,
      body: SingleChildScrollView(
        child: Column(
          children: [_HeadPageMovie(), _BodyPageMovie()],
        ),
      ),
    );
  }
}

class _HeadPageMovie extends StatelessWidget {
  const _HeadPageMovie();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'c𝘩𝘪𝘭𝘭 𝘮𝘰𝘷𝘪𝘦𝘴',
            style: JtStyle.bigText.copyWith(color: JtColor.teal),
          ),
          const Spacer(),
          Assets.icons.movie.image(height: 40)
        ],
      ),
    );
  }
}

class _BodyPageMovie extends StatelessWidget {
  const _BodyPageMovie();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageMovieCubit, PageMovieState>(
      builder: (context, state) {
        if (state is PageMovieLoading) {
          return const LoadingWidget();
        }
        if (state is PageMovieError) {
          return const ErrorPage();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...context.read<PageMovieCubit>().responModel.items!.map((e) =>
                MovieConsumer(
                    movie: e,
                    pathImage:
                        context.read<PageMovieCubit>().responModel.pathImage ??
                            ''))
          ],
        );
      },
    );
  }
}
