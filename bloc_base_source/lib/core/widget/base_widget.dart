import 'package:bloc_base_source/core/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/base_bloc.dart';
import '../bloc/event.dart';

abstract class BaseView<B extends BaseBloc> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => createBloc(),
      child: BlocConsumer<B, BaseState>(
          listenWhen: (BaseState previous, BaseState current) {
        // return true/false to determine whether or not
        // to invoke listener with state
        return true;
      }, listener: (BuildContext context, BaseState state) {
        // do stuff here based on BlocA's state
        if (state is LoadingDialogState) {
          showDialogView(
              context: context,
              content: Row(
                children: [
                  const CircularProgressIndicator(),
                  Container(
                      margin: const EdgeInsets.only(left: 7),
                      child: const Text("Loading...")),
                ],
              ));
        }
        if (state is ErrorDialogState) {
          showDialogView(
              context: context,
              content: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 7),
                      child: Text("Error : ${state.message}")),
                ],
              ));
        }
      }, buildWhen: (BaseState previous, BaseState current) {
        // return true/false to determine whether or not
        // to rebuild the widget with state
        return rebuildViewWhen(previous, current);
      }, builder: (contextBuilder, BaseState state) {
        // return widget here based on BlocA's state
        if (state is InitialState) {
          contextBuilder.read<B>().add(InitialEvent());
        }
        return buildView(contextBuilder, state);
      }),
    );
  }

  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is! DialogState;

  Widget buildView(BuildContext context, BaseState state);

  B createBloc();

  showDialogView({required BuildContext context, required Widget content}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: content);
      },
    );
  }
}
