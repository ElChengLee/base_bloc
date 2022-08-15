import 'package:bloc_base_source/bloc/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends BaseBloc<AppNavigateEvent, AppNavigateState> {
  ApplicationBloc(AppNavigateState initialState) : super(initialState);

  @override
  Future<void> handleEvent(
      AppNavigateEvent event, Emitter<AppNavigateState> emit) async {
    if (event is HomeNavigateEvent) {
      emit.call(HomeNavigateState());
    }
  }
}
