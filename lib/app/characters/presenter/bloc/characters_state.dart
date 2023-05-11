part of 'characters_bloc.dart';

enum CharactersStatus {
  initial,
  loading,
  loaded,
  failure,
}

enum NextCharactersStatus {
  initial,
  loading,
  loaded,
  failure,
}

class CharactersState extends Equatable {
  const CharactersState({
    required this.status,
    required this.nextCharactersStatus,
    required this.characters,
    required this.failure,
  });

  final CharactersStatus status;
  final NextCharactersStatus nextCharactersStatus;
  final List<Character> characters;
  final Failure? failure;

  bool get isInitial => status == CharactersStatus.initial;
  bool get isLoading => status == CharactersStatus.loading;
  bool get isLoaded => status == CharactersStatus.loaded;
  bool get isFailure => status == CharactersStatus.failure;

  bool get isNextInitial => status == NextCharactersStatus.initial;
  bool get isNextLoading => status == NextCharactersStatus.loading;
  bool get isNextLoaded => status == NextCharactersStatus.loaded;
  bool get isNextFailure => status == NextCharactersStatus.failure;

  CharactersState copyWith({
    CharactersStatus? status,
    NextCharactersStatus? nextCharactersStatus,
    List<Character>? characters,
    Failure? failure,
  }) {
    return CharactersState(
      status: status ?? this.status,
      nextCharactersStatus: nextCharactersStatus ?? this.nextCharactersStatus,
      characters: characters ?? this.characters,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        nextCharactersStatus,
        characters,
        failure,
      ];
}
