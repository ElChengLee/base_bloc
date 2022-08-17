import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

// ProcessingState detects state when load data and view from host/database/init view
abstract class ProcessingState extends BaseState {
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

abstract class ViewState extends ProcessingState {}

abstract class DialogState extends ProcessingState {}

class LoadingViewState extends ViewState {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class LoadingDialogState extends DialogState {
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

class ErrorViewState extends ViewState {
  final String? message;

  ErrorViewState({this.message = "Unknown Error Message"});

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}

class ErrorDialogState extends DialogState {
  final String? message;

  ErrorDialogState({this.message = "Unknown Error Message"});

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}
