import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../data/remote/dto/model_base_response.dart';
import '../../../../../data/remote/service/service_constants.dart';
import '../../models/login_request.dart';
import '../../models/login_response.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST('/authenticate' + ServiceConstants.version)
  Future<ModelBaseResponse<LoginResponse>> performLogin(@Body() LoginRequest model);
}
