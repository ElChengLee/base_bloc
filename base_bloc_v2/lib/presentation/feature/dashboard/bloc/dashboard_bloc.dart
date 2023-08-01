import 'package:base_bloc_v2/core/bloc/base_bloc.dart';
import 'package:base_bloc_v2/core/bloc/event.dart';
import 'package:base_bloc_v2/core/bloc/state.dart';
import 'package:base_bloc_v2/presentation/feature/dashboard/bloc/dashboard_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_state.dart';

class DashboardBloc extends BaseBloc {
  DashboardBloc() : super(const InitialState());

  @override
  Future<void> onInit(Emitter<BaseState> emit) async {}

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is TapNaviEvent) {
      emit.call((BottomNaviItem.values[event.index]).naviState);
    }
  }
}
