import 'package:bloc_base_source/core/widget/base_list_view_widget.dart';
import 'package:bloc_base_source/presentation/feature/home/bloc/home_bloc.dart';
import 'package:bloc_base_source/presentation/feature/home/model/home_response.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository.dart';
import 'package:flutter/material.dart';

import '../../../../di/locator.dart';

class HomeScreen extends BaseListView<HomeBloc, HomeResponse> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeBloc createBloc() {
    return HomeBloc(locator<HomeRepository>());
  }

  @override
  Widget itemListView(BuildContext context, HomeResponse object) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(object.title,
              style: const TextStyle(color: Colors.red, fontSize: 16)),
          Text(object.description,
              style: const TextStyle(color: Colors.black, fontSize: 14)),
        ],
      ),
    );
  }

  @override
  AppBar? buildAppBar(BuildContext context) => AppBar(
        title: const Text("Home screen"),
      );
}
