import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

/// Responsible for storing data in the device's local storage.
abstract class ILocalStorage {
  /// Stores access token e.g. JWT in local storage.
  ///
  /// Right: [true] when operation is successful.
  /// Left: a [Failure] explaining why the operation failed.
  Future<Either<Failure, bool>> setAccessAndExpiryToken(
    String accessToken,
    String expireDate,
  );

  /// Returns the current access token stored in local storage if found.
  /// Otherwise, returns a [null].
  ///
  ///
  /// Right: the stored access token when operation is successful.
  /// Left: a [Failure] explaining why the operation failed.
  Future<Either<Failure, String?>> getAccessToken();

  Future<Either<Failure, String?>> getExpiryToken();

  Future<Either<Failure, bool>> clearAccessToken();

  Future<Either<Failure, bool>> setSearch(List<String> search);

  Future<Either<Failure, List<String>?>> getSearch();

  Future<Either<Failure, bool>> clearSearch();
}
