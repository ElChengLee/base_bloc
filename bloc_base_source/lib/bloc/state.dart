import 'package:equatable/equatable.dart';

// NavigateState detects screen to navigate screen
abstract class BaseNavigateState extends Equatable {
  const BaseNavigateState();

  @override
  List<Object?> get props => [];
}

// ProcessingState detects state when load data and view from host/database/init view
abstract class ProcessingState extends Equatable {
  const ProcessingState();

  @override
  List<Object?> get props => [];
}

class InitialState extends ProcessingState {
  const InitialState();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

abstract class LoadingState extends ProcessingState {}

class LoadingViewState extends LoadingState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class LoadingDialogState extends LoadingState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class SuccessState<T> extends ProcessingState {
  final T? data;

  const SuccessState(this.data);

  @override
  List<Object?> get props => [data];

  @override
  bool get stringify => true;
}

abstract class ErrorState extends ProcessingState {}

class ErrorViewState extends ErrorState {
  final String? message;

  ErrorViewState({this.message = "Unknown Error Message"});

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}

class ErrorDialogState extends ErrorState {
  final String? message;

  ErrorDialogState({this.message = "Unknown Error Message"});

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}
