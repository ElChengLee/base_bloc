import 'error_type.dart';

class Result<T> with SealedResult<T> {
  bool get isSuccessful => this is Success<T>;
}

class Success<T> extends Result<T> {
  T? data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  ErrorType type;
  String message;

  Error(this.type, this.message);

  bool get isTokenExpired => type == ErrorType.TOKEN_EXPIRED;
}

abstract class SealedResult<T> {
  R? when<R>({
    R Function(T?)? success,
    R Function(ErrorType, String)? error,
  }) {
    if (this is Success<T?>) {
      return success?.call(((this as Success).data));
    }
    if (this is Error<T>) {
      return error?.call((this as Error<T>).type, (this as Error<T>).message);
    }
    throw Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
