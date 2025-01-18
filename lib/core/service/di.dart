import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/service/network.dart';
import 'package:movie_app/features/main_page/domain/repositories/list_movie_repository.dart';
import 'package:movie_app/features/main_page/domain/repositories/movie_detail_repository.dart';
import 'package:movie_app/features/main_page/domain/usecases/list_movie_usecase.dart';
import 'package:movie_app/features/main_page/domain/usecases/movie_detail_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/login/domain/usecases/authentication_usecase.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final Dio dio = await setUpDio();

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigatorKey);

  /// register singleton
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<FirebaseAuth>(() => fireBaseAuth);

  // login service
  getIt.registerFactory<LoginUserUsecase>(() => LoginUserUsecase());

  //get list movie
  getIt.registerLazySingleton<ListMovieUsecase>(() => ListMovieUsecase(dio));
  getIt.registerLazySingleton<ListMovieRepository>(() => ListMovieRepository());
  getIt
      .registerLazySingleton<MovieDetailUsecase>(() => MovieDetailUsecase(dio));
  getIt.registerLazySingleton<MovieDetailRepository>(
      () => MovieDetailRepository());
}
