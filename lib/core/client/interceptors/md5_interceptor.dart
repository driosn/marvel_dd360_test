import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:marvel_dd360_test/core/env/env.dart';
import 'package:marvel_dd360_test/core/handlers/md5_handler.dart';

class MD5Interceptor extends Interceptor {
  const MD5Interceptor({
    required MD5Handler md5handler,
  }) : _md5handler = md5handler;

  final MD5Handler _md5handler;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final hash = _md5handler.encryptForApiUse();
    options.queryParameters.putIfAbsent('apikey', () => Env.publicKey);
    options.queryParameters.putIfAbsent('hash', () => hash.result);
    options.queryParameters.putIfAbsent('ts', () => hash.timeStamp);
    super.onRequest(options, handler);
  }
}
