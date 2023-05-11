import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/data/models/event_model.dart';
import 'package:marvel_dd360_test/core/client/interceptors/dio_client.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/domain/entities/event.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/events_repository.dart';

class EventsApiRepository implements EventsRepository {
  const EventsApiRepository({
    required DioClient client,
  }) : _client = client;

  final DioClient _client;

  @override
  Future<Either<Failure, List<Event>>> getEventsByCharacterId(
    int characterId, {
    int offset = 0,
    int limit = 50,
  }) async {
    try {
      final response = await _client.dio
          .get('/characters/$characterId/events?offset=$offset&limit=$limit');

      if (response.statusCode == 200) {
        return Right(
          List<Event>.from(
            response.data['data']['results'].map(
              (eventJson) => EventModel.fromJson(eventJson),
            ),
          ),
        );
      }

      if (response.statusCode == 401) {
        return const Left(
          Failure(
            type: FailureType.unauthorized,
            message: 'Unauthorized',
          ),
        );
      }

      return const Left(
        Failure(
          type: FailureType.unexpected,
          message: 'Unexpected error',
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
          type: FailureType.unexpected,
        ),
      );
    }
  }
}
