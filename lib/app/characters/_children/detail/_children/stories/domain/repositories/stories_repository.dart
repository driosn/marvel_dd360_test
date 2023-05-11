import 'package:dartz/dartz.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/domain/entities/story.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

abstract class StoriesRepository {
  Future<Either<Failure, List<Story>>> getStoriesByCharacterId(
    int id, {
    int offset = 0,
    int limit = 50,
  });
}
