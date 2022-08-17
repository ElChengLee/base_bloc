// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/service/navigation_service.dart' as _i9;
import '../presentation/feature/home/remote/repository/home_repository.dart'
    as _i3;
import '../presentation/feature/home/remote/repository/home_repository_impl.dart'
    as _i4;
import '../presentation/feature/home/remote/service/home_service.dart' as _i5;
import '../presentation/feature/login/remote/repository/login_repository.dart'
    as _i6;
import '../presentation/feature/login/remote/repository/login_repository_impl.dart'
    as _i7;
import '../presentation/feature/login/remote/service/login_service.dart' as _i8;
import '../presentation/routers/router.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HomeRepository>(
      () => _i4.HomeRepositoryImpl(get<_i5.HomeService>()));
  gh.factory<_i6.LoginRepository>(
      () => _i7.LoginRepositoryImpl(get<_i8.LoginService>()));
  gh.lazySingleton<_i9.NavigationService>(
      () => _i9.NavigationService(get<_i10.AppRouter>()));
  return get;
}
