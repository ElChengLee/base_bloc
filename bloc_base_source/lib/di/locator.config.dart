// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_base_source/core/service/navigation_service.dart' as _i10;
import 'package:bloc_base_source/data/local/dao/home_dao.dart' as _i6;
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository.dart'
    as _i3;
import 'package:bloc_base_source/presentation/feature/home/remote/repository/home_repository_impl.dart'
    as _i4;
import 'package:bloc_base_source/presentation/feature/home/remote/service/home_service.dart'
    as _i5;
import 'package:bloc_base_source/presentation/feature/login/remote/repository/login_repository.dart'
    as _i7;
import 'package:bloc_base_source/presentation/feature/login/remote/repository/login_repository_impl.dart'
    as _i8;
import 'package:bloc_base_source/presentation/feature/login/remote/service/login_service.dart'
    as _i9;
import 'package:bloc_base_source/presentation/routers/app_router.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HomeRepository>(() => _i4.HomeRepositoryImpl(
          gh<_i5.HomeService>(),
          gh<_i6.HomeDao>(),
        ));
    gh.factory<_i7.LoginRepository>(
        () => _i8.LoginRepositoryImpl(gh<_i9.LoginService>()));
    gh.lazySingleton<_i10.NavigationService>(
        () => _i10.NavigationService(gh<_i11.AppRouter>()));
    return this;
  }
}
