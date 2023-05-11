part of 'comics_bloc.dart';

enum ComicsStatus {
  initial,
  loading,
  loaded,
  failure,
}

enum NextComicsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class ComicsState extends Equatable {
  const ComicsState({
    required this.status,
    required this.comics,
    required this.nextComicsStatus,
    required this.failure,
  });

  final ComicsStatus status;
  final NextComicsStatus nextComicsStatus;
  final List<Comic> comics;
  final Failure? failure;

  bool get isInitial => status == ComicsStatus.initial;
  bool get isLoading => status == ComicsStatus.loading;
  bool get isLoaded => status == ComicsStatus.loaded;
  bool get isFailure => status == ComicsStatus.failure;

  bool get isNextInitial => status == NextComicsStatus.initial;
  bool get isNextLoading => status == NextComicsStatus.loading;
  bool get isNextLoaded => status == NextComicsStatus.loaded;
  bool get isNextFailure => status == NextComicsStatus.failure;

  ComicsState copyWith({
    ComicsStatus? status,
    NextComicsStatus? nextComicsStatus,
    List<Comic>? comics,
    Failure? failure,
  }) {
    return ComicsState(
      status: status ?? this.status,
      nextComicsStatus: nextComicsStatus ?? this.nextComicsStatus,
      comics: comics ?? this.comics,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        nextComicsStatus,
        comics,
        failure,
      ];
}
