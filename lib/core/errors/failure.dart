class Failure {
  final String message;
  Failure(this.message);
}

class ApiError extends Failure {
  ApiError(super.message);
}

class NetworkError extends Failure {
  NetworkError(super.message);
}

class CacheError extends Failure {
  CacheError(super.message);
}
