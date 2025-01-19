import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routers/routers.dart';
import 'package:movie_app/features/main_page/presentation/cubit/list_moive/list_movie_cubit.dart';
import 'package:movie_app/features/main_page/presentation/cubit/page_movie/page_movie_cubit.dart';
import 'core/service/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListMovieCubit()..getListMovie(),
        ),
        BlocProvider(
          create: (context) => PageMovieCubit()..getPageMovies(2),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
