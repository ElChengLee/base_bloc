import 'package:auto_route/auto_route.dart';

import '../feature/home/view/home_screen.dart';
import '../feature/login/view/login_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeRoute.page),
  ];
}
