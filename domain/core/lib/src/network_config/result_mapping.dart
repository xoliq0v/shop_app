import '../../core.dart';

class Result<T> {
  Result.completed(this.data, [this.error]) : status = Status.completed;

  Result.error(this.error) : status = Status.error;
  Status status;
  T? data;
  ResultError? error;

  @override
  String toString() {
    return '$status $error $data';
  }
}

class ResultError extends Equatable {
  const ResultError({
    required this.message,
    required this.reason,
  });

  final String message;
  final String reason;

  @override
  List<Object?> get props => [message, reason];
}

enum Status { completed, error }