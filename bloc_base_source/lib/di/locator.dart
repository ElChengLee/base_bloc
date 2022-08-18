import 'dart:io';

import 'package:bloc_base_source/data/local/dao/home_dao.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/service/home_service.dart';
import 'package:bloc_base_source/presentation/routers/router.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
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

void _registerNetworkModules(GetIt locator) {
  Dio dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  dioAdapter.onPost(
      "/authenticate/1.0",
      (server) => {
            server.reply(
              HttpStatus.ok,
              {
                "requestId": "",
                "status": "0",
                "desc": "SUCCESS",
                "message": null,
                "data": {"token": "Token data"}
              },
              // Reply would wait for one-sec before returning data.
              delay: const Duration(seconds: 3),
            )
          },
      data: Matchers.any);
  dioAdapter.onPost(
      "/home/1.0",
      (server) => {
            server.reply(
              HttpStatus.ok,
              {
                "requestId": "799637ab-4bf4-4bc4-86dd-7aa7a36488c7",
                "status": "0",
                "desc": "Success",
                "message": "",
                "data": [
                  {"id": 1, "title": "Title 1", "description": "Description 1"},
                  {"id": 2, "title": "Title 2", "description": "Description 2"}
                ]
              },
              // Reply would wait for one-sec before returning data.
              delay: const Duration(seconds: 10),
            )
          },
      data: Matchers.any);
  dio.options = BaseOptions(
    baseUrl: ServiceConstants.baseUrl,
    contentType: NetworkRequestValues.contentType,
    sendTimeout: ServiceConstants.timeOut,
    connectTimeout: ServiceConstants.timeOut,
    receiveTimeout: ServiceConstants.timeOut,
  );
  dio.interceptors.add(addInterceptor());
  locator.registerSingleton<Dio>(dio);
}

InterceptorsWrapper addInterceptor() {
  return InterceptorsWrapper(onRequest: (_option, _handler) {
    _option.headers = {
      RequestHeader.tokenKey: token,
      RequestHeader.language: langApp
    };
    Fimber.d("Request:");
    Fimber.d("Log Url request: ${_option.baseUrl}");
    Fimber.d("Log header request: ${_option.headers.toString()}");
    _handler.next(_option);
  }, onResponse: (_response, _handler) {
    Fimber.d(
        "Response: ${_response.data?.toString() ?? _response.statusCode ?? "logResponseInterceptor empty"}");
    _handler.next(_response);
  }, onError: (_error, _handler) {
    Fimber.d("Error: ${_error.error?.toString()}");
    _handler.next(_error);
  });
}

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