import 'package:bloc_base_source/feature/app/bloc/application_bloc.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screen/home_screen.dart';
import '../../login/view/login_screen.dart';
import '../bloc/application_state.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ApplicationBloc(LoginNavigateState()),
          )
        ],
        child: BlocConsumer<ApplicationBloc, AppNavigateState>(
            listenWhen: (previous, current) {
          // return true/false to determine whether or not
          // to invoke listener with state
          return true;
        }, listener: (context, state) {
          // do stuff here based on BlocA's state
          Fimber.e("a");
          _navigator.pushAndRemoveUntil<void>(
            HomeScreen.route(),
            (route) => false,
          );
        }, buildWhen: (previous, current) {
          // return true/false to determine whether or not
          // to rebuild the widget with state
          return true;
        }, builder: (context, state) {
          // return widget here based on BlocA's state
          return child ?? Container();
        }),
      ),
      onGenerateRoute: (_) => LoginScreen.route(),
    );
  }
}
