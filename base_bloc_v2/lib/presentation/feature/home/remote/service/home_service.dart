import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../data/remote/dto/model_base_response.dart';
import '../../../../../data/remote/service/service_constants.dart';
import '../../model/home_response.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio) = _HomeService;

  @POST('/home/' + ServiceConstants.version)
  Future<ModelBaseResponse<List<HomeResponse>>> loadHomeData();

  @POST('/checkTokenExpired/' + ServiceConstants.version)
  Future<ModelBaseResponse<List<HomeResponse>>> checkTokenExpired();
}
