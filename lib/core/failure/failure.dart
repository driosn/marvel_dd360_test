enum FailureType { noConnection, unauthorized, unexpected }

class Failure {
  const Failure({
    required this.type,
    required this.message,
  });

  final FailureType type;
  final String message;
}
