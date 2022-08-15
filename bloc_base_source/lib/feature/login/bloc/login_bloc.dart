import 'package:bloc_base_source/bloc/state.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/base_bloc.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../remote/repository/login_repository.dart';
import 'login_event.dart';

class LoginBloc extends BaseBloc<LoginEvent, ProcessingState> {
  final LoginRepository _loginRepository;
  String userName = "";
  String password = "";

  LoginBloc(this._loginRepository) : super(const InitialState());

  @override
  Future<void> handleEvent(LoginEvent event, Emitter<ProcessingState> emit) async {
    if (event is LoginUsernameChanged) {
      userName = event.username;
    } else if (event is LoginPasswordChanged) {
      password = event.password;
    } else if (event is LoginSubmitted) {
     await safeDataCall(
        emit,
        callToHost:
            _loginRepository.performLogin(LoginRequest("0366541214", "123456")),
        success: (LoginResponse data) {
          Fimber.e("login success data - ${data.token}");
          emit(SuccessState(data));
        },
      );
    }
  }
}
