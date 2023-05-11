import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/data/repositories/comic_api_repository.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/domain/entities/comic.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/presenter/bloc/bloc/comics_bloc.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/presenter/pages/comic_detail_page.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/presenter/pages/comics_page.dart';
import 'package:marvel_dd360_test/app/characters/domain/entities/character.dart';

import '../../../../../../core/client/interceptors/dio_client.dart';
import 'domain/repositories/comic_repository.dart';

class ComicsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ComicRepository>((i) => ComicApiRepository(
              client: i<DioClient>(),
            )),
        Bind<ComicsBloc>(
          (i) => ComicsBloc(
            repository: i<ComicRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => ComicsPage(
            character: args.data as Character,
          ),
        ),
        ChildRoute(
          '/comics/detail/',
          child: (context, args) => ComicDetailPage(
            comic: args.data as Comic,
          ),
        )
      ];
}
