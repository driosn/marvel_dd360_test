import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/domain/entities/event.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/presenter/bloc/events_bloc.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/presenter/pages/event_detail_page.dart';
import 'package:marvel_dd360_test/app/characters/domain/entities/character.dart';

import '../../../../../../core/client/interceptors/dio_client.dart';
import '../Events/presenter/pages/Events_page.dart';
import 'data/repositories/events_api_repository.dart';
import 'domain/repositories/events_repository.dart';

class EventsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<EventsRepository>((i) => EventsApiRepository(
              client: i<DioClient>(),
            )),
        Bind<EventsBloc>(
          (i) => EventsBloc(
            repository: i<EventsRepository>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => EventsPage(
            character: args.data as Character,
          ),
        ),
        ChildRoute(
          '/events/detail/',
          child: (context, args) => EventDetailPage(
            event: args.data as Event,
          ),
        )
      ];
}
