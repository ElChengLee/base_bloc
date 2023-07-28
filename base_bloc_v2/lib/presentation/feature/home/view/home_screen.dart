import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/base_list_view_widget.dart';
import '../../../../di/locator.dart';
import '../bloc/home_bloc.dart';
import '../model/home_response.dart';
import '../remote/repository/home_repository.dart';

@RoutePage()
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
