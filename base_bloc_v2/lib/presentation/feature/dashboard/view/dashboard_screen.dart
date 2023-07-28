import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_v2/core/bloc/state.dart';
import 'package:base_bloc_v2/core/widget/base_widget.dart';
import 'package:base_bloc_v2/presentation/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends BaseView<DashboardBloc> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context, BaseState state) {
    // TODO: implement buildView
    throw UnimplementedError();
  }

  @override
  DashboardBloc createBloc() {
    // TODO: implement createBloc
    throw UnimplementedError();
  }
}
