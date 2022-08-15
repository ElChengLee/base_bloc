import 'package:json_annotation/json_annotation.dart';

part 'model_base_response.g.dart';

const String successStatus = "0";
const String parseError = "-1";
const String timeOut = "-2";
const String unknownError = "-99";
const String tokenExprired = "401";

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ModelBaseResponse<T> {
  final String? requestId;
  final String? status;
  final String? desc;
  final String? message;
  final T? data;

  ModelBaseResponse(this.requestId, this.status, this.desc, this.message, this.data);

  bool isSuccess() => successStatus == status;

  bool isTimeOut() => timeOut == status;

  bool isTokenExprired() => tokenExprired == status;

  factory ModelBaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ModelBaseResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$ModelBaseResponseToJson<T>(this, toJsonT);
}