import 'package:dio/dio.dart';

Future<Dio> setUpDio({String baseUrl = 'https://ophim1.com/'}) async {
  final options = BaseOptions(
    connectTimeout: const Duration(seconds: 12),
    receiveTimeout: const Duration(seconds: 12),
    responseType: ResponseType.json,
    baseUrl: baseUrl,
  );
  final Dio dio = Dio(options);
  return dio;
}
