part of 'stories_bloc.dart';

abstract class StoriesEvent extends Equatable {
  const StoriesEvent();

  @override
  List<Object> get props => [];
}

class GetStoriesByCharacterIdEvent extends StoriesEvent {
  const GetStoriesByCharacterIdEvent({
    required this.characterId,
  });

  final int characterId;
}
