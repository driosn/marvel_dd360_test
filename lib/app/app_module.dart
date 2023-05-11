import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/characters_module.dart';

import '../core/client/interceptors/dio_client.dart';
import '../core/client/interceptors/md5_interceptor.dart';
import '../core/handlers/md5_handler.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<MD5Handler>(
          (i) => MD5Handler(),
        ),
        Bind<MD5Interceptor>(
          (i) => MD5Interceptor(
            md5handler: i<MD5Handler>(),
          ),
        ),
        Bind<Dio>(
          (i) => Dio(),
        ),
        Bind<DioClient>(
          (i) => DioClient(
            dio: i<Dio>(),
            md5interceptor: i<MD5Interceptor>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: CharactersModule(),
        )
      ];
}
