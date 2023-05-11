import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/data/models/story_model.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/domain/entities/story.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/domain/repositories/stories_repository.dart';
import 'package:marvel_dd360_test/core/client/interceptors/dio_client.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

class StoriesApiRepository implements StoriesRepository {
  const StoriesApiRepository({
    required DioClient client,
  }) : _client = client;

  final DioClient _client;

  @override
  Future<Either<Failure, List<Story>>> getStoriesByCharacterId(
    int id, {
    int offset = 0,
    int limit = 100,
  }) async {
    try {
      final response = await _client.dio
          .get('/characters/$id/stories?offset=$offset&limit=$limit');

      if (response.statusCode == 200) {
        return Right(
          List<Story>.from(
            response.data['data']['results'].map(
              (storyJson) => StoryModel.fromJson(storyJson),
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
