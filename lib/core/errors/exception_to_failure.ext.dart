part of 'failure.dart';

// TODO - Use [BaseStrings]
extension ExceptionToFailureX on Exception {
  /// Transforms different types of [Exception]s into
  /// corresponding [Failure]s
  Failure get toFailure {
    if (this is DioException) {
      return NetworkFailure.fromDioError(this as DioExceptionType);
    } else if (this is SocketException) {
      return const NoInternetFailure();
    } else if (this is TimeoutException) {
      debugPrint('Encountered ${(this as TimeoutException).duration}');
      return const TimeoutFailure();
    } else if (this is FormatException) {
      final errMsg = (this as FormatException).toString();
      debugPrint('Encountered a FormatException: $errMsg');

      return const Failure('Failed to format incoming data.');
    } else {
      debugPrint('Encountered unhandled Exceptions: ${toString()}');
      return const Failure('An unknown error has occured');
    }
  }
}
