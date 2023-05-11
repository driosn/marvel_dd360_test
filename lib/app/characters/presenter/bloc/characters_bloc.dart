import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_dd360_test/app/characters/domain/repositories/characters_repository.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entities/character.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({
    required CharactersRepository charactersRepository,
  })  : _repository = charactersRepository,
        super(
          const CharactersState(
            status: CharactersStatus.initial,
            characters: [],
            nextCharactersStatus: NextCharactersStatus.initial,
            failure: null,
          ),
        ) {
    on<GetCharactersEvent>(_onGetInitialCharactersEvent);
    on<GetNextCharactersEvent>(_onGetNextCharactersEvent);
  }

  final CharactersRepository _repository;

  void _onGetInitialCharactersEvent(
    GetCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    emit(
      state.copyWith(status: CharactersStatus.loading),
    );
    final result = await _repository.getCharacters();
    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          status: CharactersStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: CharactersStatus.loaded,
        characters: foldedResult as List<Character>,
      ),
    );
  }

  void _onGetNextCharactersEvent(
    GetNextCharactersEvent event,
    Emitter<CharactersState> emit,
  ) async {
    if (state.nextCharactersStatus == NextCharactersStatus.loading) {
      return;
    }

    emit(
      state.copyWith(nextCharactersStatus: NextCharactersStatus.loading),
    );
    final result = await _repository.getCharacters(
      offset: state.characters.length,
    );
    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          nextCharactersStatus: NextCharactersStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        nextCharactersStatus: NextCharactersStatus.loaded,
        characters: state.characters + (foldedResult as List<Character>),
      ),
    );
  }
}
