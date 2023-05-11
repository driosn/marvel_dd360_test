import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/data/models/comic_model.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/domain/entities/comic.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/domain/repositories/comic_repository.dart';
import 'package:marvel_dd360_test/core/client/interceptors/dio_client.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

class ComicApiRepository implements ComicRepository {
  const ComicApiRepository({
    required DioClient client,
  }) : _client = client;

  final DioClient _client;

  @override
  Future<Either<Failure, List<Comic>>> getComicsByCharacterId(
    int characterId, {
    int offset = 0,
    int limit = 10,
  }) async {
    try {
      final response = await _client.dio
          .get('/characters/$characterId/comics?offset=$offset&limit=$limit');

      if (response.statusCode == 200) {
        return Right(
          List<Comic>.from(
            response.data['data']['results'].map(
              (comicJson) => ComicModel.fromJson(comicJson),
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
