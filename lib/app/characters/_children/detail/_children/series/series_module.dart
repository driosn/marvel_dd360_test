import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/series/presenter/pages/series_detail_page.dart';

import '../../../../../../core/client/interceptors/dio_client.dart';
import '../../../../domain/entities/character.dart';
import '../series/presenter/bloc/series_bloc.dart';
import 'presenter/pages/series_page.dart';
import 'data/repositories/series_api_repository.dart';
import 'domain/repositories/series_repository.dart';

class SeriesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<SeriesRepository>(
          (i) => SeriesApiRepository(
            client: i<DioClient>(),
          ),
        ),
        Bind<SeriesBloc>(
          (i) => SeriesBloc(
            repository: i<SeriesRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SeriesPage(
            character: args.data as Character,
          ),
        ),
        ChildRoute(
          '/serie/detail/',
          child: (context, args) => SerieDetailPage(
            serie: args.data,
          ),
        )
      ];
}
