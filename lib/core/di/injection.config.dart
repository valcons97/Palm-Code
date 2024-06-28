// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:palm_codes/core/core.dart' as _i3;
import 'package:palm_codes/core/di/core.module.dart' as _i19;
import 'package:palm_codes/core/storage/i_local_storage.dart' as _i13;
import 'package:palm_codes/core/storage/local_storage.dart' as _i14;
import 'package:palm_codes/features/home/cubit/detail/detail_cubit.dart' as _i4;
import 'package:palm_codes/features/home/cubit/favorite/favorite_cubit.dart'
    as _i5;
import 'package:palm_codes/features/home/cubit/home/home_cubit.dart' as _i18;
import 'package:palm_codes/features/home/cubit/home_nav/home_nav_cubit.dart'
    as _i6;
import 'package:palm_codes/features/home/pages/home/home_nav_observer.dart'
    as _i12;
import 'package:palm_codes/features/home/services/home_repository.dart' as _i16;
import 'package:palm_codes/features/index.dart' as _i15;
import 'package:palm_codes/network/di/rest.module.dart' as _i20;
import 'package:palm_codes/network/provider/dio_provider.dart' as _i10;
import 'package:palm_codes/network/rest.dart' as _i8;
import 'package:palm_codes/network/services/auth/auth.dart' as _i17;
import 'package:palm_codes/network/services/auth/service_client/home_service_client.dart'
    as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

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
    gh.factory<_i5.FavoriteCubit>(() => _i5.FavoriteCubit());
    gh.singleton<_i6.HomeNavCubit>(() => _i6.HomeNavCubit());
    await gh.lazySingletonAsync<_i7.SharedPreferences>(
      () => coreModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.HttpClientProvider>(
        () => restModule.httpClientProvider);
    gh.lazySingleton<_i9.HomeServiceClient>(
        () => _i9.HomeServiceClient(gh<_i8.HttpClientProvider>()));
    gh.lazySingleton<_i10.DioProvider>(() => _i10.DioProvider(gh<_i11.Dio>()));
    gh.singleton<_i12.HomeNavObserver>(
        () => _i12.HomeNavObserver(gh<_i6.HomeNavCubit>()));
    gh.lazySingleton<_i13.ILocalStorage>(
        () => _i14.LocalStorage(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i15.IHomeRepository>(
      () => _i16.HomeRepository(gh<_i17.HomeServiceClient>()),
      registerFor: {
        _dev,
        _prod,
        _test,
      },
    );
    gh.factory<_i18.HomeCubit>(
        () => _i18.HomeCubit(gh<_i15.IHomeRepository>()));
    return this;
  }
}

class _$CoreModule extends _i19.CoreModule {}

class _$RestModule extends _i20.RestModule {}
