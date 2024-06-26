import 'package:palm_codes/features/index.dart';

/// Home response object as defined in home API
class HomeResponse {
  HomeResponse({
    required this.books,
  });

  /// Deserialize JSON payload into [this].
  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    return HomeResponse(
      books: HomeModel.fromJson(json),
    );
  }

  final HomeModel books;
}
