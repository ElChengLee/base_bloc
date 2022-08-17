import '../../../../../core/common/result.dart';
import '../../models/login_request.dart';
import '../../models/login_response.dart';

abstract class LoginRepository {
  Future<Result<LoginResponse>> performLogin(LoginRequest model);

}
