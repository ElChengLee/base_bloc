import '../../../../../core/bloc/state.dart';

enum BottomNaviItem { Home, List, Setting, Other }

abstract class DashboardState extends BaseState {}

class BottomNaviState extends DashboardState {
  final int index;

  BottomNaviState({this.index = 0});

  @override
  List<Object?> get props => [index];
}

BottomNaviItem convertNaviStateToEnum(BottomNaviState state) {
  return BottomNaviItem.values[state.index];
}

extension BottomNaviItemExtension on BottomNaviItem {
  BottomNaviState get naviState =>
      BottomNaviState(index: BottomNaviItem.values.indexOf(this));
}