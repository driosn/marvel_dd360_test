import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/series/domain/repositories/series_repository.dart';

import '../../../../../../../../core/failure/failure.dart';
import '../../domain/entities/serie.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc({
    required SeriesRepository repository,
  })  : _repository = repository,
        super(
          const SeriesState(
            status: SeriesStatus.initial,
            nextStatus: NextStatus.initial,
            series: [],
            failure: null,
          ),
        ) {
    on<GetSeriesByCharacterIdEvent>(_onGetSeriesByCharacterIdEvent);
    on<GetNextSeriesByCharacterIdEvent>(_onGetNextSeriesByCharacterIdEvent);
  }

  final SeriesRepository _repository;

  void _onGetSeriesByCharacterIdEvent(
    GetSeriesByCharacterIdEvent event,
    Emitter<SeriesState> emit,
  ) async {
    emit(
      state.copyWith(status: SeriesStatus.loading),
    );
    final result = await _repository.getSeriesByCharacterId(
      event.characterId,
    );
    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          status: SeriesStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: SeriesStatus.loaded,
        series: foldedResult as List<Serie>,
      ),
    );
  }

  void _onGetNextSeriesByCharacterIdEvent(
    GetNextSeriesByCharacterIdEvent event,
    Emitter<SeriesState> emit,
  ) async {
    emit(
      state.copyWith(nextStatus: NextStatus.loading),
    );
    final result = await _repository.getSeriesByCharacterId(
      event.characterId,
      offset: state.series.length,
    );

    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          nextStatus: NextStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        nextStatus: NextStatus.loaded,
        series: state.series + (foldedResult as List<Serie>),
      ),
    );
  }
}
