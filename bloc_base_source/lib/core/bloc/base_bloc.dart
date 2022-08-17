import 'package:bloc_base_source/core/bloc/event.dart';
import 'package:bloc_base_source/core/common/error_type.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/locator.dart';
import '../common/result.dart';
import '../service/navigation_service.dart';
import 'state.dart';

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {
  NavigationService get navigationService => locator<NavigationService>();

  BaseBloc(BaseState state) : super(state) {
    on<BaseEvent>((event, emit) async {
      if (event is InitialEvent) {
        await onInit(emit);
      } else {
        await handleEvent(event, emit);
      }
    });
  }

  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit);

  Future<void> onInit(Emitter<BaseState> emit) async {}

  Future<void> safeDataCall<T>(
    Emitter<BaseState> emit, {
    Future<Result<T>>? callToHost,
    Future<Result<T>>? callToDb,
    Function(Emitter<BaseState> emit, T? data)? success,
    Function(Emitter<BaseState> emit)? loading,
    Function(Emitter<BaseState> emit, String message)? error,
  }) async {
    assert(callToHost != null || callToDb != null,
        "at least callToHost or callToDb must be non-null ");
    Fimber.d("callToHost");
    loading != null ? loading.call(emit) : emit(LoadingDialogState());

    // case 1: Call db before get data from host.
    // case 2: Only call db to get data
    if (callToDb != null) {
      Fimber.d("start call db");
      (await callToDb).when(success: (data) async {
        if (callToHost == null && success == null) {
          hideDialogState();
        }
        success != null ? success.call(emit, data) : emit(SuccessState(data));
      }, error: (type, message) async {
        if (callToHost == null) {
          if (error == null) {
            hideDialogState();
            emit(ErrorDialogState(message: message));
          } else {
            error.call(emit, message);
          }
        }
      });
    }

    // call data from host.
    if (callToHost != null) {
      Fimber.d("start call host");
      (await callToHost).when(success: (data) async {
        if (success == null) {
          hideDialogState();
          emit(SuccessState(data));
        } else {
          success.call(emit, data);
        }
      }, error: (type, message) async {
        if (error == null) {
          hideDialogState();
        }
        if (type == ErrorType.TOKEN_EXPIRED) {
          error != null
              ? error.call(emit, message)
              : emit(ErrorDialogState(message: message));
        } else {
          error != null
              ? error.call(emit, message)
              : emit(ErrorDialogState(message: message));
        }
      });
    }
  }

  void hideDialogState() {
    if (state is DialogState) {
      navigationService.pop();
    }
  }
}
