import 'package:flutter/foundation.dart';

import '../rest.dart';

/// Skeleton for a class interacting with our REST API.
abstract class RestServiceClient {
  const RestServiceClient(this.httpClientProvider);

  @protected
  final HttpClientProvider httpClientProvider;
}
