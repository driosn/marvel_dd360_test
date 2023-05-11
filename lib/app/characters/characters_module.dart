import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/character_detail_module.dart';
import 'package:marvel_dd360_test/app/characters/data/repositories/characters_api_repository.dart';
import 'package:marvel_dd360_test/app/characters/domain/repositories/characters_repository.dart';
import 'package:marvel_dd360_test/app/characters/presenter/bloc/characters_bloc.dart';
import 'package:marvel_dd360_test/app/characters/presenter/pages/characters_page.dart';

import '../../core/client/interceptors/dio_client.dart';

class CharactersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<CharactersRepository>((i) => CharactersApiRepository(
              client: i<DioClient>(),
            )),
        Bind<CharactersBloc>(
          (i) => CharactersBloc(
            charactersRepository: i<CharactersRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CharactersPage(),
        ),
        ModuleRoute(
          'detail/',
          module: CharacterDetailModule(),
        )
      ];
}
