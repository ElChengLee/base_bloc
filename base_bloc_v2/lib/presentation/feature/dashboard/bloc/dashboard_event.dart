import 'package:base_bloc_v2/core/bloc/event.dart';

abstract class DashboardEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class TapNaviEvent extends DashboardEvent {
  TapNaviEvent(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}