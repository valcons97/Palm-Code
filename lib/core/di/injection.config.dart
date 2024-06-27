// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:palm_codes/core/core.dart' as _i3;
import 'package:palm_codes/core/di/core.module.dart' as _i17;
import 'package:palm_codes/core/storage/i_local_storage.dart' as _i11;
import 'package:palm_codes/core/storage/local_storage.dart' as _i12;
import 'package:palm_codes/features/home/cubit/home_cubit.dart' as _i16;
import 'package:palm_codes/features/home/cubit/home_nav/home_nav_cubit.dart'
    as _i4;
import 'package:palm_codes/features/home/pages/home/home_nav_observer.dart'
    as _i10;
import 'package:palm_codes/features/home/services/home_repository.dart' as _i14;
import 'package:palm_codes/features/index.dart' as _i13;
import 'package:palm_codes/network/di/rest.module.dart' as _i18;
import 'package:palm_codes/network/provider/dio_provider.dart' as _i8;
import 'package:palm_codes/network/rest.dart' as _i6;
import 'package:palm_codes/network/services/auth/auth.dart' as _i15;
import 'package:palm_codes/network/services/auth/service_client/home_service_client.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    final restModule = _$RestModule();
    gh.factory<_i3.AppRouter>(() => coreModule.router);
    gh.singleton<_i4.HomeNavCubit>(() => _i4.HomeNavCubit());
    await gh.lazySingletonAsync<_i5.SharedPreferences>(
      () => coreModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i6.HttpClientProvider>(
        () => restModule.httpClientProvider);
    gh.lazySingleton<_i7.HomeServiceClient>(
        () => _i7.HomeServiceClient(gh<_i6.HttpClientProvider>()));
    gh.lazySingleton<_i8.DioProvider>(() => _i8.DioProvider(gh<_i9.Dio>()));
    gh.singleton<_i10.HomeNavObserver>(
        () => _i10.HomeNavObserver(gh<_i4.HomeNavCubit>()));
    gh.lazySingleton<_i11.ILocalStorage>(
        () => _i12.LocalStorage(gh<_i5.SharedPreferences>()));
    gh.lazySingleton<_i13.IHomeRepository>(
      () => _i14.HomeRepository(gh<_i15.HomeServiceClient>()),
      registerFor: {
        _dev,
        _prod,
        _test,
      },
    );
    gh.factory<_i16.HomeCubit>(
        () => _i16.HomeCubit(gh<_i13.IHomeRepository>()));
    return this;
  }
}

class _$CoreModule extends _i17.CoreModule {}

class _$RestModule extends _i18.RestModule {}
