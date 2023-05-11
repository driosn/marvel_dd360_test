import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/presenter/bloc/stories_bloc.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/presenter/pages/stories_page.dart';

import '../../../../../../core/client/interceptors/dio_client.dart';
import '../../../../domain/entities/character.dart';
import 'data/repositories/stories_api_repository.dart';
import 'domain/repositories/stories_repository.dart';

class StoriesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<StoriesRepository>(
          (i) => StoriesApiRepository(
            client: i<DioClient>(),
          ),
        ),
        Bind<StoriesBloc>(
          (i) => StoriesBloc(
            repository: i<StoriesRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => StoriesPage(
            character: args.data as Character,
          ),
        )
      ];
}
