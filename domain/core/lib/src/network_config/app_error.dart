class SessionExpiredException implements Exception {}

class RequestCancelled implements Exception {
  RequestCancelled([this.message]);

  final String? message;
}