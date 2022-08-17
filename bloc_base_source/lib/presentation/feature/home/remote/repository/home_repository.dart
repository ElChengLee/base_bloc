
import 'package:bloc_base_source/presentation/feature/home/model/home_response.dart';

import '../../../../../core/common/result.dart';

abstract class HomeRepository {
  Future<Result<List<HomeResponse>>> loadHomeData();

  Future<Result<List<HomeResponse>>> getLocalHomeData();
}
