import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseView<T extends Bloc> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

}