import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/presentation/error_page.dart';
import 'package:movie_app/core/presentation/loading.dart';
import 'package:movie_app/core/widgets/showSnackBar/show_snackbar.dart';
import 'package:movie_app/features/main_page/domain/entities/response_model.dart';
import 'package:movie_app/features/main_page/presentation/cubit/list_moive/list_movie_cubit.dart';
import 'package:movie_app/features/main_page/presentation/widgets/each_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    late final ResponModel data = context.read<ListMovieCubit>().listMovie();

    return BlocConsumer<ListMovieCubit, ListMovieState>(
      listener: (context, state) {
        if (state is ListMovieError) {
          context.showSnackBarFail(text: state.error);
        }
      },
      builder: (context, state) {
        if (state is ListMovieLoading) {
          return const Center(child: LoadingWidget());
        }
        if (state is ListMovieError) {
          return ErrorPage(
            reload: () {
              context.read<ListMovieCubit>().getListMovie();
            },
          );
        }
        if (state is ListMovieLoaded) {
          return PageView(
            scrollDirection: Axis.vertical,
            children: data.items!
                .map((e) => EachPageView(
                      e: e,
                      ontap: () {
                        context.go('/detail/${e.slug}');
                      },
                      parthImage: data.pathImage!,
                    ))
                .toList(),
          );
        }
        return const Text('nothing');
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
