part of 'events_bloc.dart';

enum EventsStatus {
  initial,
  loading,
  loaded,
  failure,
}

enum NextStatus {
  initial,
  loading,
  loaded,
  failure,
}

class EventsState extends Equatable {
  const EventsState({
    required this.status,
    required this.nextStatus,
    required this.events,
    required this.failure,
  });

  final EventsStatus status;
  final NextStatus nextStatus;

  final List<Event> events;
  final Failure? failure;

  bool get isInitial => status == EventsStatus.initial;
  bool get isLoading => status == EventsStatus.loading;
  bool get isLoaded => status == EventsStatus.loaded;
  bool get isFailure => status == EventsStatus.failure;

  bool get isNextInitial => status == NextStatus.initial;
  bool get isNextLoading => status == NextStatus.loading;
  bool get isNextLoaded => status == NextStatus.loaded;
  bool get isNextFailure => status == NextStatus.failure;

  EventsState copyWith({
    EventsStatus? status,
    NextStatus? nextStatus,
    List<Event>? events,
    Failure? failure,
  }) {
    return EventsState(
      status: status ?? this.status,
      nextStatus: nextStatus ?? this.nextStatus,
      events: events ?? this.events,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        nextStatus,
        events,
        failure,
      ];
}
