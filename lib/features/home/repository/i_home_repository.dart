import 'package:dartz/dartz.dart';
import 'package:palm_codes/features/index.dart';

import '../../../core/core.dart';

abstract class IHomeRepository {
  Future<Either<Failure, HomeModel>> getBooks({int? page});
}
