import 'dart:io';

sealed class Result<S, E extends Exception> {
  const Result();

  bool get isFailure => this is Failure<S, E>;

  S get value => (this as Success<S, E>).value;
  E get error => (this as Failure<S, E>).error;
  HttpException get apiException => error as HttpException;
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success(this.value);

  @override
  final S value;
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure(this.error);

  @override
  final E error;
}
