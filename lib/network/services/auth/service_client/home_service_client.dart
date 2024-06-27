import 'package:injectable/injectable.dart';

import '../../rest_service_client.dart';
import '../auth.dart';
import '../endpoints.dart';

@lazySingleton
class HomeServiceClient extends RestServiceClient {
  const HomeServiceClient(
    super.httpClientProvider,
  );

  Future<HomeResponse> getBooks({int? page = 1, String? search}) async {
    final res = await httpClientProvider.get(
      '$homePath$page&search=$search',
      (json) => HomeResponse.fromJson(json),
    );

    return res;
  }
}
