import 'package:bloc_base_source/core/bloc/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/bloc/state.dart';
import '../remote/repository/home_repository.dart';

class HomeBloc extends BaseBloc {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const InitialState());

  @override
  Future<void> onInit(Emitter<BaseState> emit) async {
   await safeDataCall(
      emit,
      callToHost: _repository.loadHomeData(),
      loading: (emit) => emit.call(LoadingViewState()),
      error: (emit, message) => emit.call(ErrorViewState(message: message)),
      callToDb: _repository.getLocalHomeData(),
    );
  }

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {}
}
