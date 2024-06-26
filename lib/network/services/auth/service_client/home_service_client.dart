import 'package:injectable/injectable.dart';

import '../../rest_service_client.dart';
import '../auth.dart';
import '../endpoints.dart';

@lazySingleton
class HomeServiceClient extends RestServiceClient {
  const HomeServiceClient(
    super.httpClientProvider,
  );

  Future<HomeResponse> getBooks() async {
    final res = await httpClientProvider.get(
      homePath,
      (json) => HomeResponse.fromJson(json),
    );

    return res;
  }
}
