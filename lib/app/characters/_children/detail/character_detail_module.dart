import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/comics_module.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/events_module.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/series/series_module.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/stories_module.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/presenter/character_detail_page.dart';

import '../../domain/entities/character.dart';

class CharacterDetailModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => CharacterDetailPage(
            character: args.data as Character,
          ),
        ),
        ModuleRoute(
          'comics/',
          module: ComicsModule(),
        ),
        ModuleRoute(
          'events/',
          module: EventsModule(),
        ),
        ModuleRoute(
          'series/',
          module: SeriesModule(),
        ),
        ModuleRoute(
          'stories/',
          module: StoriesModule(),
        ),
      ];
}
