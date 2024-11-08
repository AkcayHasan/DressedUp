sealed class NetworkResult<T> {
  const NetworkResult();
}

class Success<T> extends NetworkResult<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends NetworkResult<T> {
  final int? code;
  final String message;
  const Error(this.message, {this.code});
}

class ExceptionResult<T> extends NetworkResult<T> {
  final Exception exception;
  const ExceptionResult(this.exception);
}

class Loading<T> extends NetworkResult<T> {
  const Loading();
}