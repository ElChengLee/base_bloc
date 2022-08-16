// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/service/navigation_service.dart' as _i6;
import '../presentation/feature/login/remote/repository/login_repository.dart'
    as _i3;
import '../presentation/feature/login/remote/repository/login_repository_impl.dart'
    as _i4;
import '../presentation/feature/login/remote/service/login_service.dart' as _i5;
import '../presentation/routers/router.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.LoginRepository>(
      () => _i4.LoginRepositoryImpl(get<_i5.LoginService>()));
  gh.lazySingleton<_i6.NavigationService>(
      () => _i6.NavigationService(get<_i7.AppRouter>()));
  return get;
}
