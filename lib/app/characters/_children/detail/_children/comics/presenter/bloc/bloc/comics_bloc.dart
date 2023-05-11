import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/domain/entities/comic.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/comics/domain/repositories/comic_repository.dart';

import '../../../../../../../../../core/failure/failure.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  ComicsBloc({
    required ComicRepository repository,
  })  : _repository = repository,
        super(
          const ComicsState(
            status: ComicsStatus.initial,
            nextComicsStatus: NextComicsStatus.initial,
            comics: [],
            failure: null,
          ),
        ) {
    on<GetComicsByCharacterIdEvent>(_onGetComicsByCharacterIdEvent);
    on<GetNextComicsByCharacterIdEvent>(_onGetNextComicsByCharacterIdEvent);
  }

  final ComicRepository _repository;

  void _onGetComicsByCharacterIdEvent(
    GetComicsByCharacterIdEvent event,
    Emitter<ComicsState> emit,
  ) async {
    emit(
      state.copyWith(status: ComicsStatus.loading),
    );
    final result = await _repository.getComicsByCharacterId(
      event.characterId,
    );
    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          status: ComicsStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(state.copyWith(
      status: ComicsStatus.loaded,
      comics: foldedResult as List<Comic>,
    ));
  }

  void _onGetNextComicsByCharacterIdEvent(
    GetNextComicsByCharacterIdEvent event,
    Emitter<ComicsState> emit,
  ) async {
    if (state.nextComicsStatus == NextComicsStatus.loading) {
      return;
    }

    emit(
      state.copyWith(
        nextComicsStatus: NextComicsStatus.loading,
      ),
    );
    final result = await _repository.getComicsByCharacterId(
      event.characterId,
      offset: state.comics.length,
    );
    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          nextComicsStatus: NextComicsStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(state.copyWith(
      nextComicsStatus: NextComicsStatus.loaded,
      comics: state.comics + (foldedResult as List<Comic>),
    ));
  }
}
