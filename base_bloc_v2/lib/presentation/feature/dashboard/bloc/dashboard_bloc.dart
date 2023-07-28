import 'package:base_bloc_v2/core/bloc/base_bloc.dart';
import 'package:base_bloc_v2/core/bloc/event.dart';
import 'package:base_bloc_v2/core/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends BaseBloc {
  DashboardBloc() : super(const InitialState());

  @override
  Future<void> onInit(Emitter<BaseState> emit) async {}

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {}
}
