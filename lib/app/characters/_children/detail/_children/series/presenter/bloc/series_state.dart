part of 'series_bloc.dart';

enum SeriesStatus {
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

class SeriesState extends Equatable {
  const SeriesState({
    required this.status,
    required this.nextStatus,
    required this.series,
    required this.failure,
  });

  final SeriesStatus status;
  final NextStatus nextStatus;
  final List<Serie> series;
  final Failure? failure;

  bool get isInitial => status == SeriesStatus.initial;
  bool get isLoading => status == SeriesStatus.loading;
  bool get isLoaded => status == SeriesStatus.loaded;
  bool get isFailure => status == SeriesStatus.failure;

  bool get isNextInitial => status == NextStatus.initial;
  bool get isNextLoading => status == NextStatus.loading;
  bool get isNextLoaded => status == NextStatus.loaded;
  bool get isNextFailure => status == NextStatus.failure;

  SeriesState copyWith({
    SeriesStatus? status,
    NextStatus? nextStatus,
    List<Serie>? series,
    Failure? failure,
  }) {
    return SeriesState(
      status: status ?? this.status,
      nextStatus: nextStatus ?? this.nextStatus,
      series: series ?? this.series,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        nextStatus,
        series,
        failure,
      ];
}
