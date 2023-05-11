import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/domain/entities/story.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/stories/domain/repositories/stories_repository.dart';

import '../../../../../../../../core/failure/failure.dart';

part 'stories_event.dart';
part 'stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc({required StoriesRepository repository})
      : _repository = repository,
        super(
          const StoriesState(
            status: StoriesStatus.initial,
            stories: [],
            failure: null,
          ),
        ) {
    on<GetStoriesByCharacterIdEvent>(_onGetStoriesByCharacterIdEvent);
  }

  final StoriesRepository _repository;

  FutureOr<void> _onGetStoriesByCharacterIdEvent(
    GetStoriesByCharacterIdEvent event,
    Emitter<StoriesState> emit,
  ) async {
    emit(
      state.copyWith(status: StoriesStatus.loading),
    );
    final result = await _repository.getStoriesByCharacterId(
      event.characterId,
    );
    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          status: StoriesStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: StoriesStatus.loaded,
        stories: foldedResult as List<Story>,
      ),
    );
  }
}
