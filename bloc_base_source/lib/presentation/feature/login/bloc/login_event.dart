import '../../../../core/bloc/event.dart';

abstract class LoginEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  LoginSubmitted();
}
