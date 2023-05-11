part of 'series_bloc.dart';

abstract class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class GetSeriesByCharacterIdEvent extends SeriesEvent {
  const GetSeriesByCharacterIdEvent({
    required this.characterId,
  });

  final int characterId;
}

class GetNextSeriesByCharacterIdEvent extends SeriesEvent {
  const GetNextSeriesByCharacterIdEvent({
    required this.characterId,
  });

  final int characterId;
}
