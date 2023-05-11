import 'package:dartz/dartz.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

import '../entities/serie.dart';

abstract class SeriesRepository {
  Future<Either<Failure, List<Serie>>> getSeriesByCharacterId(
    int id, {
    int offset = 0,
    int limit = 50,
  });
}
