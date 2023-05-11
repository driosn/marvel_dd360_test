part of 'stories_bloc.dart';

enum StoriesStatus {
  initial,
  loading,
  loaded,
  failure,
}

class StoriesState extends Equatable {
  const StoriesState({
    required this.status,
    required this.stories,
    required this.failure,
  });

  final StoriesStatus status;
  final List<Story> stories;
  final Failure? failure;

  bool get isInitial => status == StoriesStatus.initial;
  bool get isLoading => status == StoriesStatus.loading;
  bool get isLoaded => status == StoriesStatus.loaded;
  bool get isFailure => status == StoriesStatus.failure;

  StoriesState copyWith({
    StoriesStatus? status,
    List<Story>? stories,
    Failure? failure,
  }) {
    return StoriesState(
      status: status ?? this.status,
      stories: stories ?? this.stories,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        stories,
        failure,
      ];
}
