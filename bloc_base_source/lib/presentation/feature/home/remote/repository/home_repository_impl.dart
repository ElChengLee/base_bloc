import 'package:bloc_base_source/presentation/feature/home/model/home_response.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository.dart';
import 'package:bloc_base_source/presentation/feature/home/remote/service/home_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../../../data/repository/base_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends BaseRepository implements HomeRepository {
  final HomeService _homeService;

  HomeRepositoryImpl(this._homeService);

  @override
  Future<Result<List<HomeResponse>>> loadHomeData() {
    return safeApiCall(_homeService.loadHomeData());
  }
}
