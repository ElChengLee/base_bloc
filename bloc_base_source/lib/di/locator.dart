import 'package:bloc_base_source/data/local/dao/home_dao.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/service/home_service.dart';
import 'package:bloc_base_source/presentation/remote/dio_network.dart';
import 'package:bloc_base_source/presentation/routers/router.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../data/local/db/app_database.dart';
import '../../data/remote/service/service_constants.dart';
import '../presentation/feature/login/remote/service/login_service.dart';
import 'locator.config.dart';

final locator = GetIt.instance..allowReassignment = true;

String token = "";
String langApp = RequestHeaderValue.langVi;

@injectableInit
Future<void> setupLocator() async {
  _init(locator);
  $initGetIt(locator);
}

void _init(GetIt locator) {
  _registerRouterBuilder(locator);
  _registerNetworkModules(locator);
  _registerServices(locator);
  _registerDatabase(locator);
}

void _registerRouterBuilder(GetIt locator) {
  locator.registerLazySingleton<AppRouter>(() => AppRouter());
}

void _registerNetworkModules(GetIt locator) =>
    locator.registerSingleton<Dio>(DioNetwork().getDio());

void _registerServices(GetIt locator) {
  locator
      .registerLazySingleton<LoginService>(() => LoginService(locator<Dio>()));
  locator.registerLazySingleton<HomeService>(() => HomeService(locator<Dio>()));
}

void _registerDatabase(GetIt locator) async {
  final database =
  await $FloorAppDatabase.databaseBuilder("bloc_database.db").build();
  locator.registerLazySingleton<AppDatabase>(() => database);
  locator.registerLazySingleton<HomeDao>(
          () => locator.get<AppDatabase>().homeDao);
}