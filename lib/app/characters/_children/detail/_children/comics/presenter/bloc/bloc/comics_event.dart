part of 'comics_bloc.dart';

abstract class ComicsEvent extends Equatable {
  const ComicsEvent();

  @override
  List<Object> get props => [];
}

class GetComicsByCharacterIdEvent extends ComicsEvent {
  const GetComicsByCharacterIdEvent({
    required this.characterId,
  });

  final int characterId;
}

class GetNextComicsByCharacterIdEvent extends ComicsEvent {
  const GetNextComicsByCharacterIdEvent({
    required this.characterId,
  });

  final int characterId;
}
