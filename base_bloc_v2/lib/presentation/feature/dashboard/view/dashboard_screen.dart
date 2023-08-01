import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_v2/core/bloc/state.dart';
import 'package:base_bloc_v2/core/widget/base_widget.dart';
import 'package:base_bloc_v2/core/widget/keep_alive_widget.dart';
import 'package:base_bloc_v2/presentation/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:base_bloc_v2/presentation/feature/dashboard/bloc/dashboard_state.dart';
import 'package:base_bloc_v2/presentation/feature/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_event.dart';

@RoutePage()
class DashboardScreen extends BaseView<DashboardBloc> {
  DashboardScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController(
    keepPage: true,
  );

  @override
  Widget buildView(BuildContext context, BaseState state) {
    if (state is! BottomNaviState) {
      return Container();
    }
    BottomNaviItem bottomNaviItem = convertNaviStateToEnum(state);
    return Scaffold(
      body: buildPageView(context),
      bottomNavigationBar: buildBottomNavi(context, bottomNaviItem),
    );
  }

  @override
  DashboardBloc createBloc() {
    return DashboardBloc();
  }

  @override
  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is BottomNaviState;

  Widget buildPageView(
    BuildContext context,
  ) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        final bloc = BlocProvider.of<DashboardBloc>(context);
        bloc.add(TapNaviEvent(index));
      },
      children: const <Widget>[
        KeepAliveWidget(child: HomeScreen()),
        KeepAliveWidget(child: HomeScreen()),
        KeepAliveWidget(child: HomeScreen()),
        KeepAliveWidget(child: HomeScreen()),
      ],
    );
  }

  buildBottomNavi(
    BuildContext context,
    BottomNaviItem bottomNaviItem,
  ) {
    return BottomNavigationBar(
      currentIndex: BottomNaviItem.values.indexOf(bottomNaviItem),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 24.0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            size: 24.0,
          ),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 24.0,
          ),
          label: 'Setting',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.devices_other,
            size: 24.0,
          ),
          label: 'Other',
        ),
      ],
      onTap: (index) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 200), curve: Curves.ease);
        final bloc = BlocProvider.of<DashboardBloc>(context);
        bloc.add(TapNaviEvent(index));
      },
    );
  }
}
