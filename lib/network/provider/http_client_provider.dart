import '../models/models.dart';

abstract class HttpClientProvider {
  String? accessToken;

  Future<T> get<T>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    Map<String, dynamic>? queryParameters,
  });

  Future<T> getList<T>(
    String url,
    T Function(List) resFromJson, {
    Map<String, dynamic>? queryParameters,
  });

  Future<T> post<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  });

  Future<T> postList<T, R extends HttpRequestObject>(
    String url,
    T Function(List) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  });

  Future<T> put<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  });

  Future<T> patch<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  });

  Future<T> delete<T, R extends HttpRequestObject>(
    String url,
    T Function(Map<String, dynamic>) resFromJson, {
    R? req,
    Map<String, dynamic>? queryParameters,
  });

  // TODO: implement PUT and PATCH
}
