import 'package:dartz/dartz.dart';
import 'package:marvel_dd360_test/app/characters/domain/entities/character.dart';
import 'package:marvel_dd360_test/core/failure/failure.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<Character>>> getCharacters({
    int offset = 0,
    int limit = 50,
  });
}
