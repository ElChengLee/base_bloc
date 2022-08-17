import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../feature/home/view/home_screen.dart';
import '../feature/login/view/login_screen.dart';

part 'router.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LoginScreen, initial: true),
  AutoRoute(page: HomeScreen),
])
class AppRouter extends _$AppRouter {}
