import '../../../../../models/http_request_object.dart';

/// Request object as per defined in home API
class HomeRequest extends HttpRequestObject {
  const HomeRequest();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
