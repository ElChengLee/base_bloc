import 'package:base_bloc_v2/core/bloc/event.dart';

abstract class DashboardEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class LoadHomeView extends DashboardEvent {}