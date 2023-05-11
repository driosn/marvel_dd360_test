part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}

class GetEventsByCharacterIdEvent extends EventsEvent {
  const GetEventsByCharacterIdEvent({
    required this.characterId,
  });

  final int characterId;
}

class GetNextEventsByCharacterIdEvent extends EventsEvent {
  const GetNextEventsByCharacterIdEvent({
    required this.characterId,
  });

  final int characterId;
}
