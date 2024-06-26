import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:palm_codes/core/core.dart';

/// Contains configuration for our REST API server connection.
class RestConfig {
  /// URL to the REST API.
  static String get serverUrl =>
      dotenv.getString('REST_SERVER_URL', fallback: 'localhost:8083');

  /// Timeout for sending or receiving a request, in milliseconds.
  static int get connectionTimeout => dotenv.getInt(
        'REST_TIMEOUT_MS',
        fallback: 15000,
      );
}
