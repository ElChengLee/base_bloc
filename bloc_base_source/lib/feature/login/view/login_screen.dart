import 'package:bloc_base_source/feature/app/bloc/application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/state.dart';
import '../../../di/locator.dart';
import '../../app/bloc/application_event.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../remote/repository/login_repository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Bloc"),
      ),
      body: BlocProvider<LoginBloc>(
        create: (context) {
          return LoginBloc(locator<LoginRepository>());
        },
        child:
        BlocConsumer<LoginBloc, ProcessingState>(
            listenWhen: (previous, current) {
              // return true/false to determine whether or not
              // to invoke listener with state
              return true;
            }, listener: (context, state) {
          // do stuff here based on BlocA's state
          BlocProvider.of<ApplicationBloc>(context).add(HomeNavigateEvent());
        }, buildWhen: (previous, current) {
          // return true/false to determine whether or not
          // to rebuild the widget with state
          return true;
        }, builder: (context, state) {
          // return widget here based on BlocA's state
          return _buildBody(context);
        })
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
              onChanged: (text) => bloc.add(LoginUsernameChanged(text)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
              )),
          const SizedBox(height: 20),
          TextField(
              onChanged: (text) => bloc.add(LoginPasswordChanged(text)),
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              )),
          const SizedBox(height: 20),
          RaisedButton(
              child: const Text("Login"),
              onPressed: () {
                bloc.add(LoginSubmitted());
              })
        ]));
  }
}
