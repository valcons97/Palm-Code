// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:palm_codes/core/core.dart' as _i3;
import 'package:palm_codes/core/di/core.module.dart' as _i18;
import 'package:palm_codes/core/storage/i_local_storage.dart' as _i12;
import 'package:palm_codes/core/storage/local_storage.dart' as _i13;
import 'package:palm_codes/features/home/cubit/detail_cubit/detail_cubit.dart'
    as _i4;
import 'package:palm_codes/features/home/cubit/home_cubit.dart' as _i17;
import 'package:palm_codes/features/home/cubit/home_nav/home_nav_cubit.dart'
    as _i5;
import 'package:palm_codes/features/home/pages/home/home_nav_observer.dart'
    as _i11;
import 'package:palm_codes/features/home/services/home_repository.dart' as _i15;
import 'package:palm_codes/features/index.dart' as _i14;
import 'package:palm_codes/network/di/rest.module.dart' as _i19;
import 'package:palm_codes/network/provider/dio_provider.dart' as _i9;
import 'package:palm_codes/network/rest.dart' as _i7;
import 'package:palm_codes/network/services/auth/auth.dart' as _i16;
import 'package:palm_codes/network/services/auth/service_client/home_service_client.dart'
    as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

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
    gh.factory<_i4.DetailCubit>(() => _i4.DetailCubit());
    gh.singleton<_i5.HomeNavCubit>(() => _i5.HomeNavCubit());
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => coreModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i7.HttpClientProvider>(
        () => restModule.httpClientProvider);
    gh.lazySingleton<_i8.HomeServiceClient>(
        () => _i8.HomeServiceClient(gh<_i7.HttpClientProvider>()));
    gh.lazySingleton<_i9.DioProvider>(() => _i9.DioProvider(gh<_i10.Dio>()));
    gh.singleton<_i11.HomeNavObserver>(
        () => _i11.HomeNavObserver(gh<_i5.HomeNavCubit>()));
    gh.lazySingleton<_i12.ILocalStorage>(
        () => _i13.LocalStorage(gh<_i6.SharedPreferences>()));
    gh.lazySingleton<_i14.IHomeRepository>(
      () => _i15.HomeRepository(gh<_i16.HomeServiceClient>()),
      registerFor: {
        _dev,
        _prod,
        _test,
      },
    );
    gh.factory<_i17.HomeCubit>(
        () => _i17.HomeCubit(gh<_i14.IHomeRepository>()));
    return this;
  }
}

class _$CoreModule extends _i18.CoreModule {}

class _$RestModule extends _i19.RestModule {}
