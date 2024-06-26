import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:palm_codes/core/errors/_exporter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'i_local_storage.dart';

/// Responsible for storing data in the device's local storage using
/// [SharedPreferences].

@LazySingleton(as: ILocalStorage)
class LocalStorage extends ILocalStorage {
  LocalStorage(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      return right(_prefs.getString(_kAccessToken));
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, String?>> getExpiryToken() async {
    try {
      return right(_prefs.getString(_expiryDate));
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> setAccessAndExpiryToken(
    String accessToken,
    String expireDate,
  ) async {
    try {
      await _prefs.setString(_expiryDate, expireDate);
      final success = await _prefs.setString(_kAccessToken, accessToken);
      return right(success);
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> clearAccessToken() async {
    try {
      final success = await _prefs.remove(_kAccessToken);
      await _prefs.remove(_expiryDate);
      return right(success);
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> setSearch(List<String> search) async {
    try {
      final success = await _prefs.setStringList(_searchList, search);
      return right(success);
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, List<String>?>> getSearch() async {
    try {
      return right(_prefs.getStringList(_searchList));
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> clearSearch() async {
    try {
      final success = await _prefs.remove(_searchList);
      return right(success);
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }
}

const _kAccessToken = 'accessToken';

const _expiryDate = 'expiryToken';

const _searchList = 'searchList';
