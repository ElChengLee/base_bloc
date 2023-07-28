import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_v2/presentation/feature/dashboard/view/dashboard_screen.dart';

import '../feature/home/view/home_screen.dart';
import '../feature/login/view/login_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
