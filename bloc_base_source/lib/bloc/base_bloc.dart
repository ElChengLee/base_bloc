import 'package:bloc_base_source/data/remote/service/error_type.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/remote/service/result.dart';
import 'state.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(S state) : super(state) {
    on<E>((event, emit) async => handleEvent(event, emit));
  }

  Future<void> handleEvent(E event, Emitter<S> emit);

  Future<void> safeDataCall<T>(
    Emitter<ProcessingState> emit, {
    Future<Result<T>>? callToHost,
    Future<Result<T>>? callToDb,
    Function(T data)? success,
    Function()? loading,
    Function(String message)? error,
  }) async {
    assert(callToHost != null || callToDb != null,
        "at least callToHost or callToDb must be non-null ");

    Fimber.d("callToHost");
    loading?.call() ?? emit(LoadingDialogState());

    // case 1: Call db before get data from host.
    // case 2: Only call db to get data
    if (callToDb != null) {
      Fimber.d("start call db");
      (await callToDb).when(
          success: (data) async => success ?? emit(SuccessState(data)),
          error: (type, message) async {
            if (callToHost == null) {
              error?.call(message) ?? emit(ErrorDialogState(message: message));
            }
          });
    }

    // call data from host.
    if (callToHost != null) {
      Fimber.d("start call host");
      (await callToHost).when(
          success: (data) async => success ?? emit(SuccessState(data)),
          error: (type, message) async {
            if (type == ErrorType.TOKEN_EXPIRED) {
              error?.call(message) ?? emit(ErrorDialogState(message: message));
            } else {
              error?.call(message) ?? emit(ErrorDialogState(message: message));
            }
          });
    }
  }
}
