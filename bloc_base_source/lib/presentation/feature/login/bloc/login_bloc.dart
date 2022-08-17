import 'package:bloc_base_source/presentation/routers/router.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/bloc/event.dart';
import '../../../../core/bloc/state.dart';
import '../../../../di/locator.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../remote/repository/login_repository.dart';
import 'login_event.dart';

class LoginBloc extends BaseBloc {
  final LoginRepository _loginRepository;
  String userName = "";
  String password = "";

  LoginBloc(this._loginRepository) : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is LoginUsernameChanged) {
      userName = event.username;
    } else if (event is LoginPasswordChanged) {
      password = event.password;
    } else if (event is LoginSubmitted) {
      await safeDataCall(
        emit,
        callToHost:
            _loginRepository.performLogin(LoginRequest("0987654321", "123456")),
        success: (Emitter<BaseState> emit, LoginResponse? data) {
          Fimber.e("login success data - ${data?.token}");
          hideDialogState();
          token = data?.token ?? "";
          navigationService.pushAndRemoveUntil(
            const HomeScreenRoute(),
            predicate: (route) => false,
          );
        },
      );
    }
  }
}
