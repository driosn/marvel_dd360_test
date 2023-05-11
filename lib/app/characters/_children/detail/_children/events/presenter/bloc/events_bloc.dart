import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/domain/entities/event.dart';
import 'package:marvel_dd360_test/app/characters/_children/detail/_children/events/domain/repositories/events_repository.dart';

import '../../../../../../../../core/failure/failure.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc({
    required EventsRepository repository,
  })  : _repository = repository,
        super(
          const EventsState(
            status: EventsStatus.initial,
            nextStatus: NextStatus.initial,
            events: [],
            failure: null,
          ),
        ) {
    on<GetEventsByCharacterIdEvent>(_onGetEventsByCharacterIdEvent);
    on<GetNextEventsByCharacterIdEvent>(_onGetNextEventsByCharacterIdEvent);
  }

  final EventsRepository _repository;

  void _onGetEventsByCharacterIdEvent(
    GetEventsByCharacterIdEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(status: EventsStatus.loading),
    );
    final result = await _repository.getEventsByCharacterId(
      event.characterId,
    );
    final foldedResult = result.fold((l) => l, (r) => r);

    if (foldedResult is Failure) {
      emit(
        state.copyWith(
          status: EventsStatus.failure,
          failure: foldedResult,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: EventsStatus.loaded,
        events: foldedResult as List<Event>,
      ),
    );
  }

  _onGetNextEventsByCharacterIdEvent(
    GetNextEventsByCharacterIdEvent event,
    Emitter<EventsState> emit,
  ) async {
    emit(
      state.copyWith(nextStatus: NextStatus.loading),
    );
    final result = await _repository.getEventsByCharacterId(
      event.characterId,
      offset: state.events.length,
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
        events: state.events + (foldedResult as List<Event>),
      ),
    );
  }
}
