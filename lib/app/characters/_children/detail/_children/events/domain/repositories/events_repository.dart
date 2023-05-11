import 'package:dartz/dartz.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/domain/entities/event.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

abstract class EventsRepository {
  Future<Either<Failure, List<Event>>> getEventsByCharacterId(
    int characterId, {
    int offset = 0,
    int limit = 50,
  });
}
