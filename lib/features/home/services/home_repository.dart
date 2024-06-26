import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:palm_codes/network/services/auth/auth.dart';

import '../../../core/core.dart';
import '../../../core/di/di_environment.dart';
import '../../index.dart';

@LazySingleton(as: IHomeRepository, env: DiEnvironment.useNetwork)
class HomeRepository extends IHomeRepository {
  HomeRepository(this._homeServiceClient);

  final HomeServiceClient _homeServiceClient;

  @override
  Future<Either<Failure, HomeModel>> getBooks({
    int? page,
  }) async {
    try {
      final response = await _homeServiceClient.getBooks(page: page);
      return right(response.books);
    } on Exception catch (e) {
      return left(e.toFailure);
    }
  }
}
