import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../data/remote/service/service_constants.dart';
import '../../di/locator.dart';

class DioNetwork {
  Dio getDio() {
    Dio dio = Dio();
    _mockResponseData(dio);
    dio.options = BaseOptions(
      baseUrl: ServiceConstants.baseUrl,
      contentType: NetworkRequestValues.contentType,
      sendTimeout: ServiceConstants.timeOut,
      connectTimeout: ServiceConstants.timeOut,
      receiveTimeout: ServiceConstants.timeOut,
    );
    dio.interceptors.add(_addInterceptor());
    return dio;
  }

  void _mockResponseData(Dio dio) {
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
                    {
                      "id": 1,
                      "title": "Title 1",
                      "description": "Description 1"
                    },
                    {
                      "id": 2,
                      "title": "Title 2",
                      "description": "Description 2"
                    }
                  ]
                },
                // Reply would wait for one-sec before returning data.
                delay: const Duration(seconds: 10),
              )
            },
        data: Matchers.any);
  }

  InterceptorsWrapper _addInterceptor() {
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
}
