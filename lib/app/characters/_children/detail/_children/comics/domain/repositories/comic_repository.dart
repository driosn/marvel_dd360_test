import 'package:dartz/dartz.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

import '../entities/comic.dart';

abstract class ComicRepository {
  Future<Either<Failure, List<Comic>>> getComicsByCharacterId(
    int characterId, {
    int offset = 0,
    int limit = 50,
  });
}
