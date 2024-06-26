import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide HttpClientProvider;
import 'package:injectable/injectable.dart';
import 'package:palm_codes/network/config/rest.config.dart';
import 'package:palm_codes/network/models/http_request_object.dart';

import 'provider.dart';

@lazySingleton
class DioProvider extends HttpClientProvider {
  DioProvider(this._dio) {
    // setup options
    _dio.options
      ..baseUrl = RestConfig.serverUrl
      ..connectTimeout = Duration(milliseconds: RestConfig.connectionTimeout)
      ..receiveTimeout = Duration(milliseconds: RestConfig.connectionTimeout)
      ..headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      };

    // setup interceptor
    _dio.interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) {
            // append auth token on every request
            if (accessToken != null) {
              options.headers['Authorization'] = 'Bearer $accessToken';
            }

            return handler.next(options);
          },
        ),
        LogInterceptor(
          responseBody: true,
          logPrint: (obj) => debugPrint(obj.toString()),
        ),
      ],
    );
  }

  final Dio _dio;

  @override
  Future<T> get<T>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
    );

    final json = response.data as Map<String, dynamic>;
    return resFromJson(json);
  }

  @override
  Future<T> getList<T>(
    String url,
    T Function(List p1) resFromJson, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
    );

    final json = response.data as List;
    return resFromJson(json);
  }

  @override
  Future<T> post<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      url,
      data: req?.toJson(),
      queryParameters: queryParameters,
    );

    final json = response.data as Map<String, dynamic>;
    return resFromJson(json);
  }

  @override
  Future<T> postList<T, R extends HttpRequestObject>(
    String url,
    T Function(List) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.post(
      url,
      data: req?.toJson(),
      queryParameters: queryParameters,
    );

    final json = response.data as List;
    return resFromJson(json);
  }

  // TODO : check put, patch

  @override
  Future<T> put<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.put(
      url,
      data: req?.toJson(),
      queryParameters: queryParameters,
    );

    final json = response.data as Map<String, dynamic>;
    return resFromJson(json);
  }

  @override
  Future<T> patch<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.patch(
      url,
      data: req?.toJson(),
      queryParameters: queryParameters,
    );

    final json = response.data as Map<String, dynamic>;
    return resFromJson(json);
  }

  @override
  Future<T> delete<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.delete(
      url,
      data: req?.toJson(),
      queryParameters: queryParameters,
    );

    final json = response.data as Map<String, dynamic>;
    return resFromJson(json);
  }
}
