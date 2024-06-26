part of 'failure.dart';

/// For other network errors that do not require
/// special error handling in the form of popups or pages
/// designed specifically for the error
///
/// e.g. unknown error message, internal server error
class NetworkFailure extends Failure {
  const NetworkFailure([String? message])
      : super(
          message ?? 'Something went wrong. Please try again.',
        );

  factory NetworkFailure.fromDioError(DioExceptionType error) {
    switch (error) {
      case DioExceptionType.unknown:
        return const NoInternetFailure();
      case DioExceptionType.cancel:
        return const RequestCancelledFailure();
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const TimeoutFailure();
      case DioExceptionType.badResponse:
        return const NetworkFailure();
      default:
        return const NetworkFailure();
    }
  }

  factory NetworkFailure.fromHttpCode(int code) {
    switch (code) {
      case 400:
        return const InvalidArgumentFailure();
      case 401:
        return const UnauthenticatedFailure();
      case 403:
        return const ResourceForbiddenFailure();
      case 404:
        return const ResourceNotFoundFailure();
      case 408:
        return const TimeoutFailure();
      case 500:
        return const InternalServerFailure();
      case 503:
        return const ServerUnavailableFailure();
      default:
        return NetworkFailure(
          'Something went wrong. Please try again. Code: $code',
        );
    }
  }
}

/// When a request timed out.
class TimeoutFailure extends NetworkFailure {
  const TimeoutFailure([String? message])
      : super(
          message ?? 'Failed to connect to our servers. Please try again.',
        );
}

/// When device has no internet connection.
class NoInternetFailure extends NetworkFailure {
  const NoInternetFailure([String? message])
      : super(
          message ?? 'Please check your internet connection and try again.',
        );
}

/// When request contains invalid arguments.
///
/// i.e. http 400 or gRPC Invalid Argument error
class InvalidArgumentFailure extends NetworkFailure {
  const InvalidArgumentFailure([String? message])
      : super(
          message ?? 'Please check the fields',
        );
}

/// When backend returns unauthenticated.
///
/// i.e. http 401 or gRPC Unauthenticated error
class UnauthenticatedFailure extends NetworkFailure {
  const UnauthenticatedFailure([String? message])
      : super(
          message ?? 'Your session has expired.',
        );
}

/// When user has no access to this resource.
///
/// e.g. http 403 or gRPC Permission Denied error
/// when accessing endpoints reserved for internal use
class ResourceForbiddenFailure extends NetworkFailure {
  const ResourceForbiddenFailure([String? message])
      : super(
          message ?? 'You do not have access to this resource.',
        );
}

/// When a request is cancelled.
class RequestCancelledFailure extends NetworkFailure {
  const RequestCancelledFailure([String? message])
      : super(message ?? 'Request was cancelled. Please try again.');
}

/// When requested resource is not found.
///
/// e.g. failed to find an order with a particular ID
class ResourceNotFoundFailure extends NetworkFailure {
  const ResourceNotFoundFailure([String? message])
      : super(
          message ?? 'We could not find the resource you are looking for.',
        );
}

/// When an error occurs internally in the backend
/// and is not a caught exception i.e. HTTP 500.
class InternalServerFailure extends NetworkFailure {
  const InternalServerFailure([String? message])
      : super(
          message ?? 'Unexpected server error. Please try again.',
        );
}

/// When backend is unavailable.
///
/// e.g. down for maintenance, server is overloaded with requests
class ServerUnavailableFailure extends NetworkFailure {
  const ServerUnavailableFailure([String? message])
      : super(
          message ??
              'Sorry, our servers are currently busy. Please try again later.',
        );
}

/// The entity that we attempted to create already exists.
///
/// e.g Attempting to register a device that is already registered.
class AlreadyExistFailure extends NetworkFailure {
  const AlreadyExistFailure([String? message])
      : super(
          message ?? 'This resource already exists in our database.',
        );
}

/// The system is not in a state required for the operation's execution.
///
/// e.g Attempting to checkout an empty cart.
class FailedPreconditionFailure extends NetworkFailure {
  const FailedPreconditionFailure([String? message])
      : super(
          message ?? 'System is in an invalid state.',
        );
}
