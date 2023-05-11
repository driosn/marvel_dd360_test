import 'package:dio/dio.dart';

import 'md5_interceptor.dart';

class DioClient {
  DioClient({
    required this.dio,
    required MD5Interceptor md5interceptor,
  }) {
    dio.options.baseUrl = 'https://gateway.marvel.com:443/v1/public';
    dio.interceptors.add(md5interceptor);
  }

  final Dio dio;
}
