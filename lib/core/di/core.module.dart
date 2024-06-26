import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

/// Used for defining 3rd party or core services.
@module
abstract class CoreModule {
  AppRouter get router {
    return AppRouter();
  }

  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
