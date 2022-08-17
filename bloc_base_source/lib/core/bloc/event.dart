import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BaseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends BaseEvent {}
