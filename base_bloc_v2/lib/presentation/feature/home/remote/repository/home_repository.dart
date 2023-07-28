import '../../../../../core/common/result.dart';
import '../../model/home_response.dart';

abstract class HomeRepository {
  Future<Result<List<HomeResponse>>> loadHomeData();

  Future<Result<List<HomeResponse>>> getLocalHomeData();
}
