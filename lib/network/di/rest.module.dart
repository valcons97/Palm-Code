import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:palm_codes/network/rest.dart';

/// REST Dependency Injection Module
///
/// Provide all dependencies for REST related injection here
@module
abstract class RestModule {
  @lazySingleton
  HttpClientProvider get httpClientProvider => DioProvider(Dio());
}
